import { CalendarDaysIcon } from "../Components/icons/Iconscalendar";
import { ClockIcon } from "../Components/icons/Iconstime";

export default function Card({id, name, year, realisateur, img, duree}) {
    return (
        <div id={id} className="flex flex-col items-center justify-center w-96 border-2 border-transparent hover:border-cardColor cursor-pointer transition duration-300">
                <img
                        src={`/${img}`}
                        alt="Affiche de film"
                />
                <div className="bg-bgGray flex flex-col gap-2 w-full h-28 pl-4 pt-3 pb-4">
                        <h1 className="text-2xl font-bold text-white">{name}</h1>
                        <div className="flex flex-row gap-4 text-gray-400">
                        <p className="text-sm font-semibold">
                            de {realisateur}
                        </p>
                        <div className="flex flex-row gap-1 items-center">
                        <CalendarDaysIcon className="h-5 w-5" />
                        <p className="text-sm font-semibold">
                            {year}
                        </p>
                        </div>
                        <div className="flex flex-row gap-1 items-center">
                        <ClockIcon className="h-5 w-5" />
                        <p className="text-sm font-semibold">
                            {duree}
                        </p>
                        </div>
                        </div>
                </div>
        </div>
    );
}