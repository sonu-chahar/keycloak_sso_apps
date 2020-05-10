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
//    	URL geoIpDbUrl=Thread.currentThread().getContextClassLoader().getResource("GeoLite2-City.mmdb");
//    	if(dbReader==null) {
//    		if(geoIpDbUrl==null) {
//    			return null;
//    		}
//    		File geoDBFile=new File(geoIpDbUrl.getPath());
//    		dbReader = new DatabaseReader.Builder(geoDBFile).build();
//    	}
		if (dbReader == null) {
//    		File geoDBFile=new File("/home/chahar/Downloads/GeoLite2-City_20200421/GeoLite2-City.mmdb");
//    		Thread.currentThread().getContextClassLoader().getResource("GeoLite2-Country.mmdb").getFile();
//			File geoDBFile = new File(
//					Thread.currentThread().getContextClassLoader().getResource("GeoLite2-Country.mmdb").getPath());

			File geoDBFile=new File("/usr/share/GeoLite2-Country.mmdb");
			dbReader = new DatabaseReader.Builder(geoDBFile).build();
		}

		InetAddress ipAddress = InetAddress.getByName(ip);
//        CityResponse response = dbReader.city(ipAddress);
//         
//        String cityName = response.getCity().getName();
//        String latitude = 
//          response.getLocation().getLatitude().toString();
//        String longitude = 
//          response.getLocation().getLongitude().toString();
//        return new GeoIP(ip, cityName, latitude, longitude);

		CountryResponse countryRespnse = dbReader.country(ipAddress);
		String countryName = countryRespnse.getCountry().getName();
		return new GeoIP(ip, countryName);
	}
}