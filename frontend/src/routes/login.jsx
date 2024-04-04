import React from "react";
import { Link } from "react-router-dom";
import { useState } from "react";


export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState("");

  const handleSubmit = async (event) => {
    event.preventDefault();
  

    try {
      const response = await fetch("http://localhost:8080/api/login_check", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ email: email, password: password }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.message);
      }

      const data = await response.json();

      if (data.token) {
        const userResponse = await fetch("http://localhost:8080/api/user",{
          headers: {
            Authorization: `Bearer ${data.token}`,
          },
        });

        const UserData = await userResponse.json();
        console.log(UserData);
        document.cookie = `user=${JSON.stringify(UserData)}`;
      }

      document.cookie = `token=${data.token}`;
      setMessage("Vous êtes connecté !");
      window.location.href = "/";

    } catch (error) {
      setMessage('Email ou mot de passe incorrect');
    }
  };

  return (
    <section className="flex h-screen items-center justify-center">
      <form
        onSubmit={handleSubmit}
        className="w-80 rounded bg-bgGray   p-6 shadow-md"
      >
        <h2 className="mb-8 text-center text-2xl font-bold text-white">
          Connexion
        </h2>
        <div className="mb-4">
          <label className="block text-white">Email</label>
          <input
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            type="email"
            className="mt-1 w-full rounded border px-3 py-2"
          />
        </div>
        <div className="mb-6">
          <label className="block text-white">Mot de passe</label>
          <input
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            type="password"
            className="mt-1 w-full rounded border px-3 py-2"
          />
        </div>

        {message && <div className="mb-4 text-sm text-white">{message}</div>}

        <button type="submit" className="w-full rounded bg-red-500 px-4  py-2 text-white duration-300 hover:bg-red-700 hover:duration-300">
            Se connecter
        </button>
        <div className="mt-4 text-center">
          <span className="text-white">Vous n'avez pas de compte ? </span>
          <Link
            to="http://localhost:8080/register"
            className="text-blue-500 underline hover:text-blue-700"
          >
            S'inscrire
          </Link>
        </div>
      </form>
    </section>
  );
}
