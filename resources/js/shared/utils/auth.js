export function isAuth() {
    return localStorage.getItem('isAuth') === 'true';
}

export function login() {
    localStorage.setItem('isAuth', true);
}

export function logout() {
    localStorage.setItem('isAuth', false);
}