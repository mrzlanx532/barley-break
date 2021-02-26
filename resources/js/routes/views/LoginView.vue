<template>
    <div>
        <h1 class="text-center text-3xl	mb-3">Log In</h1>
        <form method="post" @submit.prevent="login">
            <div class="flex flex-col">
                <input-component name="login" label="Login" placeholder="Your login"/>
                <input-component type="password" label="Password" name="password" placeholder="Your password" autocomplete="true"/>
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
        components: { InputComponent, SubmitButton },
        methods: {
            login(){
                alert('This will be the API');
            }
        }
    }
</script>
