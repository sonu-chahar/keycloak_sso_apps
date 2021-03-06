package com.chahar.keycloak.sms.utils;

import javax.inject.Singleton;

import org.keycloak.models.UserModel;

import com.chahar.keycloak.sms.Constants;

@Singleton
public class UserAttributeUtils {

    public String getMobileNumber(UserModel user) {
        String mobileNumberCreds = user.getFirstAttribute(Constants.ATTR_MOBILE);

        String mobileNumber = null;

        if (mobileNumberCreds != null && !mobileNumberCreds.isEmpty()) {
            mobileNumber = mobileNumberCreds;
        }

        return mobileNumber;
    }
}
