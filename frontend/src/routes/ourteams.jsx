import { useLoaderData, defer, Await  } from "react-router-dom";
import Team from "../ui/Team";
import { fetchOurTeams, fetchTestimonialData } from "../lib/loaders";
import Testimonial from "../ui/Testimonial";
import { Suspense} from "react";
import TeamSkeleton from "../ui/Team/TeamSkeleton";

export async function loader({params}) {
  const dataOurTeams = fetchOurTeams(params.teamName);
  const dataTestimonial = await fetchTestimonialData(params.teamName);
  return defer({team:dataOurTeams, testimonial:dataTestimonial});
}


export default function OurTeams() {
  const data = useLoaderData();
  

  return (

      <section>
      <Suspense fallback={<TeamSkeleton/>}>
        <Await resolve={data.team} errorElement={<div>Failed to load team data</div>}> 
          {teamData => <Team {...teamData} />}
        </Await>
        </Suspense>
        <Testimonial data={data.testimonial} />
    </section>
  );
}

