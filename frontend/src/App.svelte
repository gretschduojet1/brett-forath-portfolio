<script>
  import { Router, Route } from 'svelte-routing';
</script>

<Router>
  <Route path="/" component={() => import('./lib/components/Home.svelte')} />
  <Route path="/login" component={() => import('./lib/components/Login.svelte')} />
  <Route path="/admin/*" component={() => import('./lib/components/Admin.svelte')} />
</Router>
