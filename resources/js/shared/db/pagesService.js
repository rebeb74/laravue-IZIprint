import axios from "axios";

export const updatePage = (page) =>  {
    return axios.put('/api/pages/' + page.id, page)
}