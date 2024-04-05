import React from "react";
import Cookies from "js-cookie";
import { fetchWatchlishByUser } from "../lib/loaders";
import { useEffect, useState } from "react";
import Card from "../ui/Card/Card";
import { Link } from "react-router-dom";

export async function loader() {
  const watchlistData = await fetchWatchlishByUser(
    JSON.parse(Cookies.get("user")).id,
  );
  return { watchlistData };
}

export default function ProfilDetail() {
  const [watchlistData, setWatchlistData] = useState([]);
  const [isWatchlistDeleted, setIsWatchlistDeleted] = useState(false);
  const userCookie = Cookies.get("user");
  const tokenCookie = Cookies.get("token");
  const userCooks = userCookie ? JSON.parse(userCookie) : null;
  const [user, setUser] = useState(null);
  const [isRegistrationSuccessful, setIsRegistrationSuccessful] = useState(null);
  const [pseudo, setPseudo] = useState(user ? user.pseudo : "");
  const [email, setEmail] = useState(user ? user.email : "");
  const [password, setPassword] = useState("");
  const [id, setId] = useState(user ? user.ud : "");
  const [section, setSection] = useState("infos");
  const [oldPassword, setOldPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [isDataLoaded, setIsDataLoaded] = useState(false);

  async function updatePseudo(emails, pseudos, ids, passwords) {
    try {
      console.log("Updating pseudo for:", { email, pseudo, id });

      const response = await fetch("http://localhost:8080/api/updatepseudo", {
        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          email: emails,

          pseudo: pseudos,

          id: ids,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();

        console.log("Error data:", errorData);

        throw new Error(errorData.message);
      }

      console.log(emails, passwords, pseudos);

      const response1 = await fetch("http://localhost:8080/api/login_check", {
        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          email: emails,

          password: passwords,
        }),
      });

      if (!response1.ok) {
        const errorData = await response1.json();

        throw new Error(errorData.message);
      }

      const data1 = await response1.json();
      Cookies.remove("token");
      Cookies.set("token", data1.token);

      if (data1.token) {
        const userResponse = await fetch("http://localhost:8080/api/user", {
          headers: {
            Authorization: `Bearer ${data1.token}`,
          },
        });

        const userData = await userResponse.json();

        Cookies.remove("user");

        Cookies.set("user", JSON.stringify(userData));

        window.location.reload();
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }

  async function updatePassword(email, oldPassword, newPassword, id) {
    console.log("Updating password for:", {
      email,
      newPassword,
      oldPassword,
      id,
    });

    const response = await fetch("http://localhost:8080/api/login_check", {
      method: "POST",

      headers: {
        "Content-Type": "application/json",
      },

      body: JSON.stringify({
        email: email,

        password: oldPassword,
      }),
    });

    if (!response.ok) {
      const errorData = await response.json();

      throw new Error(errorData.message);
    }

    const data = await response.json();

    console.log(data);

    try {
      const response = await fetch("http://localhost:8080/api/updatepassword", {
        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          email: email,

          password: newPassword,

          id: id,
        }),
      });

      if (!response.ok) {
        const errorData = await response.json();

        throw new Error(errorData.message);
      }

      const data = await response.json();

      Cookies.remove("token");

      Cookies.set("token", data.token);

      if (data.token) {
        const userResponse = await fetch("http://localhost:8080/api/user", {
          headers: {
            Authorization: `Bearer ${data.token}`,
          },
        });

        const userData = await userResponse.json();

        Cookies.remove("user");

        Cookies.set("user", JSON.stringify(userData));

        window.location.reload();
      }

      return data;
    } catch (error) {
      console.error("Error:", error);

      return null;
    }
  }


  useEffect(() => {
    if (user) {
      setPseudo(user.pseudo);

      setEmail(user.email);

      setId(user.id);
    }
  }, [user]);

  useEffect(() => {
    const userCookie = Cookies.get("user");

    if (userCookie) {
      setUser(JSON.parse(userCookie));
    }
  }, []);

  useEffect(() => {
    if (user && !isWatchlistDeleted && !isDataLoaded) {
      fetchWatchlishByUser(user.id)
        .then((data) => {
          setWatchlistData(data);
          setIsDataLoaded(true);
        })
        .catch((error) => console.error(error));
    }
  }, [user, isWatchlistDeleted, isDataLoaded]);


const deleteWatchlist = async () => {
  const user = JSON.parse(Cookies.get('user'));
  window.location.reload();

  const response = await fetch(`http://localhost:8080/api/watchlist/user/${user.id}/delete`, {
    method: 'DELETE',
  });

  if (response.ok) {
    setIsWatchlistDeleted(true);
    setIsDataLoaded(false); // Ajoutez cette ligne
  } else {
    console.error('Failed to delete watchlist');
  }
};

  const handleLogout = () => {
    Cookies.remove("user");
    Cookies.remove("token");
    window.location.href = "/";
  };

  return (
    <>
      <section className="my-20 flex text-white">
        <div className="flex w-screen flex-col items-center justify-center gap-40 lg:flex-row lg:items-start">
          <div className="flex flex-col items-center justify-center gap-8 rounded-2xl border-2 border-gray-500 py-10 px-2 md:px-6">
            <img className="w-32 rounded-full" src="/profil.png" alt="" />
            <div className="flex flex-col items-center justify-center gap-5">
              <h3 className=" text-2xl font-semibold">
                Bienvenue, {JSON.parse(userCookie).pseudo}
              </h3>
            </div>
            {section === "infos" && (
              <section className="bg-main-900 flex flex-col items-center justify-center gap-12 rounded-xl px-20 py-10">
                <div className="bg-main-900 flex flex-col gap-6 rounded-xl">
                  <button
                      className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
                    onClick={() => setSection("infos")}
                  >
                    Mes informations
                  </button>

                  <button
                    className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
                    onClick={() => setSection("password")}
                  >
                    Modifier mon mot de passe
                  </button>
                </div>

                <form
                  onSubmit={(e) => {
                    e.preventDefault();
                    updatePseudo(email, pseudo, id, password);
                  }}
                  className="flex flex-col gap-4"
                >
                  <label className="text">
                    Pseudo :
                    <input
                      type="pseudo"
                      value={pseudo}
                      onChange={(e) => setPseudo(e.target.value)}
                      placeholder=""
                      required
                      className="hover:ring-main-700 mt-2 w-full appearance-none rounded-md border-none bg-transparent px-3 py-2 text-sm text-neutral-100 shadow-sm ring-1 ring-inset"
                    />
                  </label>

                  <label className="">
                    Email :
                    <input
                      type="email"
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      placeholder=""
                      required
                      className="hover:ring-main-700 mt-2 w-full appearance-none rounded-md border-none bg-transparent px-3 py-2 text-sm text-neutral-100 shadow-sm ring-1 ring-inset"
                    />
                  </label>

                  <label className="">
                    Password :
                    <input
                      type="password"
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      placeholder=""
                      required
                      className="hover:ring-main-700 mt-2 w-full appearance-none rounded-md border-none bg-transparent px-3 py-2 text-sm text-neutral-100 shadow-sm ring-1 ring-inset"
                    />
                  </label>

                  <button className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300">
                    Mettre à jour mes informations
                  </button>
                </form>

                {isRegistrationSuccessful ===
                null ? null : isRegistrationSuccessful ? (
                  <p>Registration successful</p>
                ) : (
                  <p>Registration failed</p>
                )}
              </section>
            )}

            {section === "password" && (
              <section className="bg-main-900 flex flex-col items-center justify-center gap-12 rounded-xl py-10 px-2 md:px-6">
                <div className="bg-main-900 flex flex-col gap-4 rounded-xl">
                  <div>
                    <button
                      className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
                      onClick={() => setSection("infos")}
                    >
                      Mes informations
                    </button>
                  </div>

                  <div>
                    <button
                      className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
                      onClick={() => setSection("password")}
                    >
                      Modifier mon mot de passe
                    </button>
                  </div>
                </div>

                <h1 className="mb-4 text-2xl font-bold">Mot de passe</h1>

                <form
                  onSubmit={(e) => {
                    e.preventDefault();
                    updatePassword(email, oldPassword, newPassword, id);
                  }}
                  className="flex flex-col gap-4"
                >
                  <label className="">
                    Ancien mot de passe :
                    <input
                      type="password"
                      value={oldPassword}
                      onChange={(e) => setOldPassword(e.target.value)}
                      placeholder=""
                      className="hover:ring-main-700 mt-2 w-full appearance-none rounded-md border-none bg-transparent px-3 py-2 text-sm text-neutral-100 shadow-sm ring-1 ring-inset"
                    />
                  </label>

                  <label className="">
                    Nouveau mot de passe :
                    <input
                      type="password"
                      value={newPassword}
                      onChange={(e) => setNewPassword(e.target.value)}
                      placeholder=""
                      className="hover:ring-main-700 mt-2 w-full appearance-none rounded-md border-none bg-transparent px-3 py-2 text-sm text-neutral-100 shadow-sm ring-1 ring-inset"
                    />
                  </label>

                  <button className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300">
                    Update password
                  </button>
                </form>
              </section>
            )}

            <button
              onClick={deleteWatchlist}
              className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
            >
              Supprimer la watchlist
            </button>

            <button
              onClick={handleLogout}
              className="rounded bg-red-500 px-4 py-2 font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300"
            >
              Se déconnecter
            </button>
          </div>

          <div>
            <div className="flex flex-col items-center justify-center gap-12 rounded-2xl border-2 border-gray-500 p-10">
              <h2 className="rounded bg-red-500 px-4 py-2 text-lg font-semibold text-white duration-300 hover:bg-red-700 hover:duration-300">
                Votre Watchlist
              </h2>

              {Array.isArray(watchlistData.movies) &&
                watchlistData.movies.map((item) => (
                  <Link to={`/movie/${item.id}`}>
                    <Card {...item} />
                  </Link>
                ))}
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
