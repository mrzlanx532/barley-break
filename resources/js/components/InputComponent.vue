<template>
    <div class="p-1">
        <label :for="name">
            {{ label ? label : name }}
            <input :value="value"
                   :type="type"
                   :name="name"
                   class="p-2 mb-2 w-full"
                   :placeholder="placeholder"
                   :autocomplete="autocomplete"
                   @input="$emit('input', $event.target.value)"
            >
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
            autocomplete: String,
            value: String
        },
    }
</script>
