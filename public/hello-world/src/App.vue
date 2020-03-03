<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <HttpGetRequest url="http://localhost:9000/v1/posts" />
  </div>
</template>

<script>
import HttpGetRequest from "./components/HttpGetRequest.vue";

export default {
  name: "App",
  components: {
    HttpGetRequest
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
