import axios from 'axios'

const baseURL = "http://54.144.209.37:3000"

const instance = axios.create({
    baseURL: baseURL,
})

instance.interceptors.request.use(
    function (config) {
        const token = localStorage.getItem('token')
        if (token) {
            config.headers['Authorization'] = `Bearer ${token}`
        }
        return config;
    },
    function (error) {
        return Promise.reject(error);
    }
);

export default instance
export { baseURL };
