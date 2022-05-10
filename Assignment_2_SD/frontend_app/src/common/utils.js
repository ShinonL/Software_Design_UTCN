export const formatNumber = number => {
    return new Intl.NumberFormat('en-EU', { style: 'currency', currency: 'EUR' }).format(number);
}

export const logout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('role');
}