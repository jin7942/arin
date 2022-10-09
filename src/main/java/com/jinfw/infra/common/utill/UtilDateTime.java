package com.jinfw.infra.common.utill;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.jinfw.infra.common.constans.Constants;

public class UtilDateTime {

	public static LocalDateTime nowLocalDateTime() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		return localDateTime;
	}

	public static Date nowDate() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DATETIME_FORMAT_BASIC);
		Date date = simpleDateFormat.parse(localDateTimeString);
		return date;
	}

	public static String nowString() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		return localDateTimeString;
	}

	public static String calculateDayString(LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;

		if (day >= 0) {
			localDateTimeNew = localDateTime.plusDays(day);
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}

		String localDateTimeNewString = localDateTimeNew
				.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		return localDateTimeNewString;
	}

	public static LocalDateTime calculateDayLocalDateTime(LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;

		if (day >= 0) {
			localDateTimeNew = localDateTime.plusDays(Math.abs(day));
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}

		return localDateTimeNew;
	}

	public static Date calculateDayDate(LocalDateTime localDateTime, int day) throws Exception {
		LocalDateTime localDateTimeNew;

		if (day >= 0) {
			localDateTimeNew = localDateTime.plusDays(Math.abs(day));
		} else {
			localDateTimeNew = localDateTime.minusDays(Math.abs(day));
		}

		String localDateTimeNewString = localDateTimeNew
				.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Constants.DATETIME_FORMAT_BASIC);
		Date date = simpleDateFormat.parse(localDateTimeNewString);

		return date;
	}

	public static String addNowTimeString(String date) {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.TIME_FORMAT_BASIC));
		return date + " " + localDateTimeString;
	}

	public static String add00TimeString(String date) {
		return date + " 00:00:00";
	}

	public static String add59TimeString(String date) {
		return date + " 23:59:59";
	}

	public static String dateToString(Date dateParam) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateRt = simpleDateFormat.format(dateParam);
		return dateRt;
	}

	public static String dateTimeToString(Date dateTimeParam) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTimeRt = simpleDateFormat.format(dateTimeParam);
		return dateTimeRt;
	}

}
