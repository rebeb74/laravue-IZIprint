import axios from "axios";

export const createPage = (page) => {
    return axios.post('/api/pages', page);
}

export const getPages = () =>  {
    return axios.get('/api/pages');
}

export const getPageById = (id) =>  {
    return axios.get('/api/pages/' + id);
}

export const updatePage = (page) =>  {
    return axios.put('/api/pages/' + page.id, page);
}

export const deletePageById = (id) =>  {
    return axios.delete('/api/pages/' + id);
}