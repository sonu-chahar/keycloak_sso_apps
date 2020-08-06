package com.keycloak.util;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CountryResponse;

public class RawDBDemoGeoIPLocationUtil {
	private static DatabaseReader dbReader;

	public static GeoIP getLocation(String ip) throws IOException, GeoIp2Exception {

		if (dbReader == null) {
			File geoDBFile = new File("/usr/share/GeoLite2-Country.mmdb");
			dbReader = new DatabaseReader.Builder(geoDBFile).build();
		}

		InetAddress ipAddress = InetAddress.getByName(ip);

		CountryResponse countryRespnse = dbReader.country(ipAddress);
		String countryName = countryRespnse.getCountry().getName();
		return new GeoIP(ip, countryName);
	}
}