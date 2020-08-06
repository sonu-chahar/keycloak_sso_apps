package com.keycloak.config;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.keycloak.OAuth2Constants;
import org.keycloak.adapters.KeycloakDeployment;
import org.keycloak.adapters.OAuthRequestAuthenticator;
import org.keycloak.adapters.RequestAuthenticator;
import org.keycloak.adapters.spi.AdapterSessionStore;
import org.keycloak.adapters.spi.HttpFacade;
import org.keycloak.common.util.KeycloakUriBuilder;
import org.keycloak.common.util.UriUtils;
import org.keycloak.constants.AdapterConstants;
import org.keycloak.util.TokenUtil;

public class LocaleAwareOAuthRequestAuthenticator extends OAuthRequestAuthenticator {

	public static final String KC_LOCALE = "kc_locale";

	private static final Logger log = Logger.getLogger(LocaleAwareOAuthRequestAuthenticator.class);
	private RequestAuthenticator requestAuthenticator;

	public LocaleAwareOAuthRequestAuthenticator(RequestAuthenticator requestAuthenticator, HttpFacade facade,
			KeycloakDeployment deployment, int sslRedirectPort, AdapterSessionStore tokenStore) {
		super(requestAuthenticator, facade, deployment, sslRedirectPort, tokenStore);
		this.requestAuthenticator = requestAuthenticator;
	}

	private String getRedirectUriWithoutParam(String state) {
		String url = getRequestUrl();
		log.debugf("callback uri: %s", url);

		if (!facade.getRequest().isSecure()
				&& deployment.getSslRequired().isRequired(facade.getRequest().getRemoteAddr())) {
			int port = sslRedirectPort();
			if (port < 0) {
				// disabled?
				return null;
			}
			KeycloakUriBuilder secureUrl = KeycloakUriBuilder.fromUri(url).scheme("https").port(-1);
			if (port != 443)
				secureUrl.port(port);
			url = secureUrl.build().toString();
		}

		String loginHint = getQueryParamValue("login_hint");
		url = UriUtils.stripQueryParam(url, "login_hint");

		String idpHint = getQueryParamValue(AdapterConstants.KC_IDP_HINT);
		url = UriUtils.stripQueryParam(url, AdapterConstants.KC_IDP_HINT);

		String scope = getQueryParamValue(OAuth2Constants.SCOPE);
		url = UriUtils.stripQueryParam(url, OAuth2Constants.SCOPE);

		String prompt = getQueryParamValue(OAuth2Constants.PROMPT);
		url = UriUtils.stripQueryParam(url, OAuth2Constants.PROMPT);

		String maxAge = getQueryParamValue(OAuth2Constants.MAX_AGE);
		url = UriUtils.stripQueryParam(url, OAuth2Constants.MAX_AGE);

		String uiLocales = getQueryParamValue(OAuth2Constants.UI_LOCALES_PARAM);
		url = UriUtils.stripQueryParam(url, OAuth2Constants.UI_LOCALES_PARAM);

		String kcLocale = getQueryParamValue(KC_LOCALE);
		url = UriUtils.stripQueryParam(url, KC_LOCALE);

		KeycloakUriBuilder redirectUriBuilder = deployment.getAuthUrl().clone()
				.queryParam(OAuth2Constants.RESPONSE_TYPE, OAuth2Constants.CODE)
				.queryParam(OAuth2Constants.CLIENT_ID, deployment.getResourceName())
				.queryParam(OAuth2Constants.REDIRECT_URI, rewrittenRedirectUri(url))
				.queryParam(OAuth2Constants.STATE, state).queryParam("login", "true")
				.queryParam(OAuth2Constants.STATE, state).queryParam("login", "true");
		if (loginHint != null && loginHint.length() > 0) {
			redirectUriBuilder.queryParam("login_hint", loginHint);
		}
		if (idpHint != null && idpHint.length() > 0) {
			redirectUriBuilder.queryParam(AdapterConstants.KC_IDP_HINT, idpHint);
		}
		if (prompt != null && prompt.length() > 0) {
			redirectUriBuilder.queryParam(OAuth2Constants.PROMPT, prompt);
		}
		if (maxAge != null && maxAge.length() > 0) {
			redirectUriBuilder.queryParam(OAuth2Constants.MAX_AGE, maxAge);
		}
		if (uiLocales != null && uiLocales.length() > 0) {
			redirectUriBuilder.queryParam(OAuth2Constants.UI_LOCALES_PARAM, uiLocales);
		}

		if (kcLocale != null && kcLocale.length() > 0) {
			redirectUriBuilder.queryParam(KC_LOCALE, kcLocale);
		}

		scope = TokenUtil.attachOIDCScope(scope);
		redirectUriBuilder.queryParam(OAuth2Constants.SCOPE, scope);

		return redirectUriBuilder.build().toString();
	}

	@Override
	protected String getRedirectUri(String state) {
		String redirect = getRedirectUriWithoutParam(state);

		if (redirect == null) {
			return null;
		}

		String kcLocale = "en";

		if (requestAuthenticator instanceof LocaleAwareRequestAuthenticator) {
			LocaleAwareRequestAuthenticator localeAwareRequestAuthenticator = (LocaleAwareRequestAuthenticator) requestAuthenticator;
			HttpServletRequest httpServletRequest = localeAwareRequestAuthenticator.getHttpServletRequest();
			kcLocale = httpServletRequest.getParameter(KC_LOCALE);
		}
		return redirect + "&kc_locale=" + kcLocale;
	}

	public static Map<String, List<String>> splitQuery(URL url) throws UnsupportedEncodingException {
		final Map<String, List<String>> queryPairs = new LinkedHashMap<String, List<String>>();
		if (url.getQuery() != null) {
			final String[] pairs = url.getQuery().split("&");
			for (String pair : pairs) {
				final int idx = pair.indexOf('=');
				final String key = idx > 0 ? URLDecoder.decode(pair.substring(0, idx), "UTF-8") : pair;
				if (!queryPairs.containsKey(key)) {
					queryPairs.put(key, new LinkedList<String>());
				}
				final String value = idx > 0 && pair.length() > idx + 1
						? URLDecoder.decode(pair.substring(idx + 1), "UTF-8")
						: null;
				queryPairs.get(key).add(value);
			}
		}
		return queryPairs;
	}

	private String rewrittenRedirectUri(String originalUri) {
		Map<String, String> rewriteRules = deployment.getRedirectRewriteRules();
		if (rewriteRules != null && !rewriteRules.isEmpty()) {
			try {
				URL url = new URL(originalUri);
				Map.Entry<String, String> rule = rewriteRules.entrySet().iterator().next();
				StringBuilder redirectUriBuilder = new StringBuilder(url.getProtocol());
				redirectUriBuilder.append("://" + url.getAuthority());
				redirectUriBuilder.append(url.getPath().replaceFirst(rule.getKey(), rule.getValue()));
				return redirectUriBuilder.toString();
			} catch (MalformedURLException ex) {
				log.error("Not a valid request url");
				throw new RuntimeException(ex);
			}
		}

		String[] redirectedUrlArr = originalUri.split("\\?");
		String redirectedUrlWithoutParam = originalUri;
		if (redirectedUrlArr != null && redirectedUrlArr.length > 2) {
			redirectedUrlWithoutParam = redirectedUrlArr[0];
		}

		return redirectedUrlWithoutParam;
	}
}