import React from 'react';
import ReactDOM from 'react-dom/client';
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Root from './routes/root.jsx';
import './index.css';
import Home from './routes/home.jsx';
import { loader as HomeLoader } from './routes/home.jsx';
import Movie from './routes/movie.jsx';
import ErrorPage from './ui/Errorpage/index.jsx';
import ProfilDetail from './routes/profil.jsx';
import Login from './routes/login.jsx';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

function ProtectedRoute({ children }) {
  const navigate = useNavigate();
  const user = Cookies.get("user");

  useEffect(() => {
    if (!user) {
      navigate('/login');
    }
  }, [user, navigate]);

  if (!user) {
    return null;
  }

  return children;
}


const router = createBrowserRouter([
  {
    path: '/',
    element: <Root/>,
    errorElement: <ErrorPage />,
  children: [
    { 
    path: '/', 
    element: <Home />, 
    loader: HomeLoader,
  },
  { 
    path: 'movie/:id', 
    element: <ProtectedRoute> <Movie /></ProtectedRoute>,
  },
  { 
    path: 'profil', 
    element: <ProtectedRoute><ProfilDetail /></ProtectedRoute>,
  }
  ,
  { 
    path: 'login', 
    element: <Login />,
  }
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
