export default {
  apiReducer: {
    apiCallsInProgress: 0
  },

  companyReducer: {
    companies: [],
    error: false,
    loading: false,
    companies: {},
    filteredCompanies: [],
    searchedCompaniesByName: [],
    companiesWithoutNill: [],
  },

  userReducer: {
    currentUser: null,
    users: [],
    user: {},
    loading: false,
    error: false,
    selectedUserId: ''
  }
};
