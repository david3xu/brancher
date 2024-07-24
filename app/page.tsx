import { createClient } from '@supabase/supabase-js';
import { cookies } from 'next/headers';
// export const dynamic = "force-dynamic"; // force dynamic, fix caching 


export default async function Home() {
  const cookieJar = cookies();
  const supabase = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );

  

  const { data } = await supabase.from("posts").select("*, comments(*)");
  console.log(`data %o`, data);
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </main>
  );
}
