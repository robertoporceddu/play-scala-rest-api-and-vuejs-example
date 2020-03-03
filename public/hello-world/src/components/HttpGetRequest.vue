<template>
  <div>
    <h1>{{ url }}</h1>
    <p class="http-response">{{ httpResponse }}</p>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HttpGetRequest",
  props: {
    url: String,
    httpResponse: String
  },
  mounted() {
    axios
      .get(this.url)
      .then(response => (this.httpResponse = response.data))
      .catch(() => (this.httpResponse = "Error retrieving data..."));
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
http-response {
  font-family: "Courier New", Courier, monospace;
  font-size: small;
}
</style>
