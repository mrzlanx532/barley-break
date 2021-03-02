<template>
    <div>
        <h1 class="text-center text-3xl	mb-3">Log In</h1>
        <form @submit.prevent="authorize">
            <div class="flex flex-col">
                <input-component v-model="formData.email" name="email" label="Email" placeholder="Your email"/>
                <input-component v-model="formData.password" name="password" label="Password" placeholder="Your password" type="password"  autocomplete="true"/>
                <submit-button/>
                <router-link to="/sign-in" class="text-center mt-1 text-blue-400 hover:text-blue-500">Sign in</router-link>
            </div>
        </form>
    </div>
</template>
<script>
    import InputComponent from "../../components/InputComponent"
    import SubmitButton from "../../components/SubmitButton"

    export default {
        data() {
          return {
              formData: {
                  email: '',
                  password: ''
              }
          }
        },
        components: { InputComponent, SubmitButton },
        methods: {
            authorize() {
                axios.post('/login', this.formData)
                    .then(response => {
                        if (response.status === 200) {
                            console.log(response.data)
                            this.$store.commit('setUser', response.data)
                            this.$router.push('/')
                        }})
                    .catch(error => {
                        if (error.response.status === 401) alert('Credentials are invalid..');
                })
            }
        }
    }
</script>
