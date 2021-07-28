<template>
  <div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
    <div class="w-1/2 bg-white rounded-lg shadow-lg mx-auto p-4">
      <h1 class="text-2xl text-gray-700 text-center mb-4">Home component</h1>
      <p>
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad, expedita?
        Officiis autem, omnis hic similique facere tempora culpa animi quisquam
        commodi illum sapiente error fugiat? Nobis, architecto? Sapiente,
        laborum sint!
      </p>
    </div>
  </div>
</template>

<script>
import getCurrentPage from "../../shared/utils/getCurrentPage";

export default {
  data() {
    return {
      currentPage: getCurrentPage(),
    };
  },
  created() {
    document
      .querySelector('meta[name="description"]')
      .setAttribute("content", this.currentPage.description);
    document.title =
      this.currentPage.title + " " + this.$store.state.siteData.suffix;
  },
};
</script>