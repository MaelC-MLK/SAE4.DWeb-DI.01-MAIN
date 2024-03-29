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
            
        