package com.Gather.Sponsorship.validate;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.Gather.Sponsorship.model.SponsorshipBean;

public class SponsorshipValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return SponsorshipBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sName"," ","必填");
	}

}
