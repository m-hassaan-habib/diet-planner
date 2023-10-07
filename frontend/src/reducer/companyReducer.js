import * as ActionType from '../action/ActionType';
import initialState from './initialState';
import _ from 'lodash';

const companyReducer = (state = initialState.companyReducer, action) => {
  switch (action.type) {
    case ActionType.GET_COMPANIES: {
      return {
        ...state,
        companies: _.assign([]),
        loading: true,
        error: false,
      };
    }
    
    case ActionType.GET_COMPANIES_SUCCESS: {
      return {
        ...state,
        companies: _.assign(action.companies),
        filteredCompanies: _.assign(action.companies),
        loading: false,
        error: false
      };
    }
    case ActionType.GET_COMPANIES_FAILURE: {
      return {
        ...state,
        loading: false,
        error: action.error,
        companies: _.assign([])
      };
    }
    case ActionType.SEARCH_COMPANIES_BY_NAME: {
      return {
        ...state,
        companies: _.assign(action.companies),
        searchedCompaniesByName: _.assign(action.companies),
        loading: false,
        error: false
      };
    }
    case ActionType.SEARCH_COMPANIES_BY_NAICS: {
      return {
        ...state,
        companies: _.assign(action.companies),
        searchedCompanies: _.assign(state.searchedCompanies.filter(company => {return (company.naics_code === null ? '' : company.naics_code.toString().toLowerCase().includes(action.value.toString().toLowerCase()))})),
        loading: false,
        error: false
      };
    }

    default: {
      return state;
    }
  }
};

export default companyReducer;
