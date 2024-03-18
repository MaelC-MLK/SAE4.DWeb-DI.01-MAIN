import NavBar from '../ui/NavBar';
import { Outlet } from 'react-router-dom';
import Button from "../ui/components/button/Button";
import { PlayIcon } from "../ui/components/icons/Icons";

export default function Root() {

  return (
    <>
    <section>
      <NavBar />
      <Outlet />
      <Button intent="btnNavPurple"> <PlayIcon className="w-5 h-5" /> Click Me </Button>
      </section>
    </>
  );
}
