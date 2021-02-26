<template>
    <div class="p-1">
        <label :for="name">
            {{ label ? label : name }}
            <input :type="type" :name="name" class="p-2 mb-2 w-full" :placeholder="placeholder" :autocomplete="autocomplete">
        </label>
    </div>
</template>

<script>
    export default {
        name: 'InputComponent',
        props: {
            name: String,
            type: {
                default: 'text',
                type: String
            },
            label: String,
            placeholder: String,
            autocomplete: String
        }
    }
</script>
