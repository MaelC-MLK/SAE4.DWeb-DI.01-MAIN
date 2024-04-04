export async function fetchAllMovieData() {
    let answer = await fetch('http://localhost:8080/api/movie');
    let data = await answer.json();
    return data; 
    }
    
export async function fetchAllCatData() {
    let answer = await fetch('http://localhost:8080/api/category');
    let data = await answer.json();
    return data; 
    }

export async function fetchByCatData(id) {
    let answer = await fetch(`http://localhost:8080/api/category/${id}`);
    let data = await answer.json();
    return data; 
    }

export async function fetchByMovieData(id) {
    let answer = await fetch(`http://localhost:8080/api/movie/${id}`);
    let data = await answer.json();
    return data; 
    }

export async function fetchMovieFront() {
    let answer = await fetch(`http://localhost:8080/api/movies/front`);
    let data = await answer.json();
    return data; 
    }

export async function fetchActiveUser(){
    let answer = await fetch('http://localhost:8080/api/user', {credentials: 'include'});
    if(answer.redirected===true)
    {
        return window.localStorage.href = answer.url;
    } else {
        let data = await answer.json();
        return data;
    }
}
export async function fetchWatchlishByUser(id){
    let answer = await fetch(`http://localhost:8080/api/watchlist/user/${id}`);
    let data = await answer.json();
    return data;
}
            