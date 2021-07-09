export function objectToArray(data) {
    return Object.keys(data).map(key => {
        return data[key];
    });
}