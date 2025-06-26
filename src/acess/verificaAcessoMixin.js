export default {
    name: "HelloView",
    beforeMount() {
      let usuario = JSON.parse(localStorage.getItem('usu'));
      console.log('eu sou usuario',usuario)
      if (usuario.tipo !== 'Root') {
        alert('Você não tem acesso a esta página');
        this.$router.push("DashboardPrincipal");
      }
    }
  };  