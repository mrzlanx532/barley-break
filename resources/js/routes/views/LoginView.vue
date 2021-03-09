<template>
    <div>
        <h1 class="text-center text-3xl	mb-3">Log In</h1>
        <form @submit.prevent="authorize">
            <div class="flex flex-col">
                <input-component v-model="formData.email" name="email" label="Email" placeholder="Your email"/>
                <input-component v-model="formData.password" name="password" label="Password" placeholder="Your password" type="password"  autocomplete="true"/>
                <submit-button/>
                <router-link to="/sign-in" class="text-center mt-1 text-brown-dark hover:text-brown-middle">Sign in</router-link>
            </div>
        </form>
    </div>
</template>
<script>
    import InputComponent from "../../components/base/InputComponent"
    import SubmitButton from "../../components/base/SubmitButton"
    import { mapActions } from "vuex"

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
            ...mapActions({
                getUser: 'getUser'
            }),
            authorize() {
                axios.post('/login', this.formData)
                    .then(async (response) => {
                        if (response.status === 200) {
                            await this.getUser();
                            this.$router.push({name: 'game'})
                        }})
                    .catch(error => {
                        if (error.response.status === 401) alert('Credentials are invalid..');
                })
            }
        }
    }
</script>
