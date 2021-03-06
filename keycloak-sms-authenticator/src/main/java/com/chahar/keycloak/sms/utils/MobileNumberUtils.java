package com.chahar.keycloak.sms.utils;

import javax.inject.Singleton;

import org.apache.commons.lang.StringUtils;

import com.chahar.keycloak.sms.Constants;

@Singleton
public class MobileNumberUtils {

    /**
     * @return return error message code if error of null if fine
     */
    public String validateMobileNumber(
            String existingMobileNumber,
            String providedMobileNumber) {
        if (StringUtils.isEmpty(providedMobileNumber)) {
            return Constants.MESSAGE_MOBILE_NUMBER_NO_VALID;
        }

        String provided = providedMobileNumber.trim();
        String existing = existingMobileNumber.trim();
        if(!existing.startsWith("+")){
        	provided=provided.substring(3);
        }

        if (!provided.equals(existing)) {
            return Constants.MESSAGE_MOBILE_NUMBER_NOT_EQUAL;
        }
        return null;
    }

}
