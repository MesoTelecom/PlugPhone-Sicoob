<template>
  <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <button @click="startEmbeddedSignup" style="padding: 10px 20px; font-size: 18px; cursor: pointer;">
      Conectar com WhatsApp
    </button>
  </div>
</template>

<script>
export default {
  name: 'WhatsAppOnboarding',
  mounted() {
    // Carrega o SDK do Facebook
    window.fbAsyncInit = function () {
      FB.init({
        appId: '7397712986921789', // substitua pelo seu App ID do Meta
        cookie: true,
        xfbml: true,
        version: 'v18.0'
      });
    };

    (function (d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "https://connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
  },
  methods: {
    startEmbeddedSignup() {
      FB.login(response => {
        console.log('Login Response:', response);
        // Aqui você pega o response.authResponse.code e envia pro seu back-end
        // pra trocar por um access_token e seguir com a integração
      }, {
        config_id: '1095624882641630', // ID da configuração do Embedded Signup
        response_type: 'code',
        extras: {
          sessionInfoVersion: 3,
          version: 'v3'
        }
      });
    }
  }
};
</script>

<style scoped>
body {
  background: #fff;
}
</style>
