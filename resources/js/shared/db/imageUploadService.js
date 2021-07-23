import axios from "axios";

export const createImageUpload = (imageUpload, options) => {
    return axios.post('/api/upload', imageUpload, options);
}

export const getImageUploads = () =>  {
    return axios.get('/api/upload');
}

export const getImageUploadById = (id) =>  {
    return axios.get('/api/upload/' + id);
}

export const updateImageUpload = (imageUpload, options) =>  {
    return axios.put('/api/upload/' + imageUpload.id, imageUpload, options);
}

export const deleteImageUploadById = (id) =>  {
    return axios.delete('/api/upload/' + id);
}

