import Pricing from "../ui/Pricing";
import { useLoaderData } from "react-router-dom";
import { fetchPricingData } from "../lib/loaders";


export async function loader() {
    let princingData = await fetchPricingData();
    return princingData;
}

export default function () {
    const data = useLoaderData();

  return (
    <>
        <Pricing  {...data} />

        {/* <Pricing 
            title={data.title}
            description={data.description}
            plans={data.plans} /> */}
    </>
  );
}
