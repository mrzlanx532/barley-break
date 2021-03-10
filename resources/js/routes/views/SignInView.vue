<template>
    <div>
        <h1 class="text-center text-3xl	mb-3">Sign In</h1>
        <form method="post" @submit.prevent="register">
            <div class="flex flex-col">
                <input-component v-model="formData.name" name="username" label="Username" placeholder="Your username"/>
                <input-component v-model="formData.email" name="email" label="Email" placeholder="Your email"/>
                <input-component v-model="formData.password" type="password" label="Password" name="password" placeholder="Your password" autocomplete="true"/>
                <input-component v-model="formData.password_repeat" type="password" label="Password" name="password_repeat" placeholder="Repeat your password" autocomplete="true"/>
                <submit-button/>
                <router-link to="/login" class="text-center mt-1 text-brown-dark hover:text-brown-middle">Log In</router-link>
            </div>
        </form>
    </div>
</template>

<script>
    import InputComponent from "../../components/base/InputComponent"
    import SubmitButton from "../../components/base/SubmitButton"

    export default {
        data() {
            return {
                formData: {
                    email: '',
                    password: '',
                    password_repeat: ''
                }
            }
        },
        components: { InputComponent, SubmitButton },
        methods: {
            register() {
                axios.post('/register', this.formData)
                    .then(async (response) => {
                        if (response.status === 200) {
                            alert('You have successfully registered!')
                            this.$router.push({name: 'login'});
                        }})
                    .catch(error => {
                        alert('Something is going wrong..')
                    })
            },
        }
    }
</script>
