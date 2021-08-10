<template>
  <div class="">
    <div v-for="block in currentPage.blocks" :key="block.id" class="">
      <block-preview :block="block"></block-preview>
    </div>
    <div v-if="currentPage.gallery.length > 0">
      <image-gallery :images="currentPage.gallery"></image-gallery>
    </div>
    <h1
      class="
        uppercase
        text-4xl text-secondary
        pt-20
        pb-4
        pl-4
        w-xs
        lg:w-5xl
        m-auto
        font-bold
      "
    >
      Contactez-nous
    </h1>
    <div class="bg-primary-gray w-full">
      <div class="m-auto w-xs lg:w-5xl py-5 lg:px-5">
        <div v-if="!emailSent">
          <div class="text-secondary-light uppercase text-xl font-bold">Formulaire de contact</div>
          <div class="card-subtitle pb-4">
            Besoin d'un devis ou d'informations ? Vous pouvez nous contacter via
            ce formulaire, et nous vous répondrons dès que possible !
          </div>
          <form
            @submit.prevent
            class="flex flex-col justify-center items-center"
          >
            <div
              class="
                w-full
                flex flex-col
                lg:flex-row
                lg:justify-between
                lg:space-x-2
              "
            >
              <base-input
                class="w-full"
                v-model="lastname.data"
                name="lastname"
                label="Nom*"
                :inputIsInvalid="lastname.initial ? false : lastname.isInvalid"
                invalidText="Le nom est requis."
                @blur="onBlurOrChangeLastname()"
                @change="onBlurOrChangeLastname()"
              ></base-input>
              <base-input
                class="w-full"
                v-model="firstname.data"
                name="firstname"
                label="Prénom*"
                :inputIsInvalid="
                  firstname.initial ? false : firstname.isInvalid
                "
                invalidText="Le prénom est requis."
                @blur="onBlurOrChangeFirstname()"
                @change="onBlurOrChangeFirstname()"
              ></base-input>
            </div>
            <base-input
              class="w-full"
              v-model="company.data"
              name="company"
              label="Entreprise"
            ></base-input>
            <div
              class="
                w-full
                flex flex-col
                lg:flex-row
                lg:justify-between
                lg:space-x-2
              "
            >
              <base-input
                class="w-full"
                v-model="email.data"
                name="email"
                label="E-mail*"
                :inputIsInvalid="email.initial ? false : email.isInvalid"
                invalidText="L'e-mail est requis."
                @blur="onBlurOrChangeEmail()"
                @change="onBlurOrChangeEmail()"
              ></base-input>
              <base-input
                class="w-full"
                v-model="phone.data"
                name="phone"
                label="Numéro de téléphone*"
                :inputIsInvalid="phone.initial ? false : phone.isInvalid"
                invalidText="Le numéro de téléphone doit avoir une longueur de 10 chiffres."
                @blur="onBlurOrChangePhone()"
                @change="onBlurOrChangePhone()"
              ></base-input>
            </div>
            <base-text-area
              class="w-full"
              :rows="4"
              v-model="content.data"
              name="content"
              label="Message*"
              invalidText="Le message est requis."
              :inputIsInvalid="content.initial ? false : content.isInvalid"
              @blur="onBlurOrChangeContent()"
              @change="onBlurOrChangeContent()"
            ></base-text-area>
            <base-button
              class="w-full py-8"
              text="Envoyer"
              :isDisabled="
                firstname.isInvalid ||
                lastname.isInvalid ||
                email.isInvalid ||
                phone.isInvalid ||
                content.isInvalid
              "
              type="submit"
              @button-click="submit()"
            ></base-button>
          </form>
        </div>
        <div v-else class="card-subtitle text-center">
          Merci ! Votre message nous est bien parvenu. Nous vous répondrons dès
          que possible !
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import indexMixin from "./mixins/indexMixin.js";
import BaseInput from "../../shared/base-components/BaseInput.vue";
import BaseTextArea from "../../shared/base-components/BaseTextArea.vue";
import BaseButton from "../../shared/base-components/BaseButton.vue";
import axios from "axios";

export default {
  mixins: [indexMixin],
  components: {
    BaseInput,
    BaseTextArea,
    BaseButton,
  },
  data() {
    return {
      emailSent: false,
      firstname: {
        data: "",
        isInvalid: true,
        initial: true,
      },
      lastname: {
        data: "",
        isInvalid: true,
        initial: true,
      },
      company: {
        data: "",
        isInvalid: true,
        initial: true,
      },
      email: {
        data: "",
        isInvalid: true,
        initial: true,
      },
      phone: {
        data: "",
        isInvalid: true,
        initial: true,
      },
      content: {
        data: "",
        isInvalid: true,
        initial: true,
      },
    };
  },
  computed: {},
  methods: {
    onBlurOrChangeFirstname() {
      this.firstname.initial = false;
      this.validateFirstname();
    },
    validateFirstname() {
      this.firstname.isInvalid = !this.firstname.data.trim();
    },
    onBlurOrChangeLastname() {
      this.lastname.initial = false;
      this.validateLastname();
    },
    validateLastname() {
      this.lastname.isInvalid = !this.lastname.data.trim();
    },
    onBlurOrChangeEmail() {
      this.email.initial = false;
      this.validateEmail();
    },
    validateEmail() {
      this.email.isInvalid =
        !this.email.data.trim() || !this.email.data.includes("@");
    },
    onBlurOrChangePhone() {
      this.phone.initial = false;
      this.validatePhone();
    },
    validatePhone() {
      const phone = this.phone.data.replaceAll(" ", "");
      this.phone.isInvalid = isNaN(phone) || phone.length !== 10;
    },
    onBlurOrChangeContent() {
      this.content.initial = false;
      this.validateContent();
    },
    validateContent() {
      this.content.isInvalid = !this.content.data.trim();
    },
    async submit() {
      this.$store.commit("setIsLoading");
      try {
        await axios.post("api/contact", {
          firstname: this.firstname.data,
          lastname: this.lastname.data,
          company: this.company.data,
          email: this.email.data,
          phone: this.phone.data,
          content: this.content.data,
        });
        this.emailSent = true;
      } catch (error) {
        console.log(error);
      }
      this.$store.commit("setIsLoading");
    },
  },
};
</script>
