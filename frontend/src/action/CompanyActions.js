import * as ActionType from './ActionType';
import API from '../lib/api';
import { makeRequest } from '../lib/requestWrapper';

export const getCompanies = {
  type: ActionType.GET_COMPANIES
};

export const getCompaniesSuccess = companies => ({
  type: ActionType.GET_COMPANIES_SUCCESS,
  companies
});


export function searchCompaniesByName(companyName, naicsCode, businessStruct, stateCity) {
  let payload = {
    companyName,
    naicsCode,
    businessStruct,
    stateCity
  }
  return {
     type: ActionType.SEARCH_COMPANIES_BY_NAME,
     payload
  }
}

export const searchCompaniesByNaics = value => ({
  type: ActionType.SEARCH_COMPANIES_BY_NAICS,
  value
});

export const getCompaniesFailure = error => ({
  type: ActionType.GET_COMPANIES_FAILURE,
  error
});

export function searchCompaniesByNameAction(companyName, naicsCode, businessStruct, stateCity, currentUser) {
  return dispatch => {
    dispatch(searchCompaniesByName(companyName, naicsCode, businessStruct, stateCity));
    return makeRequest(API.get(`/api/v1/companies?&search[company_name]=${companyName}&code_id=${naicsCode}&business_structure=${businessStruct}&cities=${stateCity}`, currentUser.accessToken))
      .then(companies => {
        dispatch(getCompaniesSuccess(companies));
      })
      .catch(error => {
        dispatch(getCompaniesFailure(error));
        throw error;
      });
  };
}

export function searchCompaniesByNaicsAction(value) {
  return dispatch => {
    dispatch(searchCompaniesByNaics(value));
  };
}

export function getCompaniesAction(page, currentUser) {
  return dispatch => {
    dispatch(getCompanies);
    return makeRequest(API.get(`/api/v1/companies?&page=${page}&limit=10`, currentUser.accessToken))
      .then(companies => {
        dispatch(getCompaniesSuccess(companies));
      })
      .catch(error => {
        dispatch(getCompaniesFailure(error));
        throw error;
      });
  };
}
