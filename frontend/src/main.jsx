import React from 'react';
import ReactDOM from 'react-dom/client';
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Root from './routes/root.jsx';
import './index.css';
import Home from './routes/home.jsx';
import { loader as HomeLoader } from './routes/home.jsx';
import Movie from './routes/movie.jsx';


const router = createBrowserRouter([
  {
    path: '/',
    element: <Root/>,
  children: [
    { 
    path: '/', 
    element: <Home />, 
    loader: HomeLoader,
  },
  { 
    path: 'movie/:id', 
    element: <Movie />,
  },
  ],
  }
]);

const rootElement = document.querySelector('#root');

if (rootElement) {
  ReactDOM.createRoot(document.querySelector('#root')).render(
    <React.StrictMode>
      <RouterProvider router={router} />
    </React.StrictMode>,
  )
} else {
  console.error('No root element found');
}
