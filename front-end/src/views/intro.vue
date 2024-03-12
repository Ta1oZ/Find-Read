<template>
  <div
    class="flex items-center justify-center bg-zinc-900"
    style="height: 100vh; width: 100%"
  >
    <div class="container text-center w-64">
      <p class="title text-5xl text-neutral-800">Find-read</p>
      <p class="subtitle text-neutral-800">Let's see what do you want</p>
      <RouterLink to="/home"
        ><button class="w-20 h-7 bg-slate-600 adjust rounded-lg">
          <span class="text-neutral-800">Let's see</span>
        </button></RouterLink
      >
    </div>
  </div>
</template>

<style >
@import url("https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
* {
  font-family: "Kanit", sans-serif;
  font-weight: 400;
  font-style: normal;
}
.title:hover,
.subtitle:hover {
  color: whitesmoke;
  padding: 0.5rem;
  text-align: center;
  text-decoration: none;
  transition: all 0.5s ease-out;
}
.adjust:hover {
  padding: 0.5rem;
  text-align: center;
  text-decoration: none;
  transition: all 0.5s ease-out;
}
</style>