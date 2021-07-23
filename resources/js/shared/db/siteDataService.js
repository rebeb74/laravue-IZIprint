import axios from "axios";

export const createSiteData = (siteData) => {
    return axios.post('/api/site', siteData);
}

export const getSiteData = () =>  {
    return axios.get('/api/site');
}


