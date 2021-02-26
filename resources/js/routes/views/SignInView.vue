<template>
    <div>
        <h1 class="text-center text-3xl	mb-3">Sign In</h1>
        <form method="post" @submit.prevent="register">
            <div class="flex flex-col">
                <input-component name="login" label="Login" placeholder="Your login"/>
                <input-component type="password" label="Password" name="password" placeholder="Your password" autocomplete="true"/>
                <input-component type="password" label="Password" name="password-repeat" placeholder="Repeat your password" autocomplete="true"/>
                <submit-button/>
                <router-link to="/login" class="text-center mt-1 text-blue-400 hover:text-blue-500">Log In</router-link>
            </div>
        </form>
    </div>
</template>

<script>
    import InputComponent from "../../components/InputComponent"
    import SubmitButton from "../../components/SubmitButton"

    export default {
        components: { InputComponent, SubmitButton },
        methods: {
            register(){
                alert('This will be the API');
            }
        }
    }
</script>
