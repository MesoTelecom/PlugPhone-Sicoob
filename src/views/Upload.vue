<template>
    <div class="hello">
        <input type="file" @change="onFileSelected">
    </div>
</template>

<script>
export default {
    name: "HelloView",
    data() {
        return {
            msg: "Welcome to your Vue.js App"
        }
    },
    methods: {
        onFileSelected(event){
            console.log(event)
        }
    },
}
</script>