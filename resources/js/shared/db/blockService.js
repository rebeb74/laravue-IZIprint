import axios from "axios";

export const createBlock = (block) => {
    return axios.post('/api/blocks', block);
}

export const getBlocks = () =>  {
    return axios.get('/api/blocks');
}

export const getBlockById = (id) =>  {
    return axios.get('/api/blocks/' + id);
}

export const updateBlock = (block) =>  {
    return axios.put('/api/blocks/' + block.id, block);
}

export const deleteBlockById = (id) =>  {
    return axios.delete('/api/blocks/' + id);
}

