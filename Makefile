all: # default

define dbuild
.PHONY: puppet_$(strip $(1))
puppet_$(strip $(1)):
	docker build --tag cyberious/rspec_puppet:$(strip $(1)) --build-arg PUPPET_VERSION="~> $(strip $(1)).0" --build-arg RUBY_VERSION="$(strip $(2))" .
TARGETS+=puppet_$(strip $(1))
$(eval $(call dpush, $(1)))
endef

define dpush
.PHONY: puppet_$(strip $(1))
push_puppet_$(strip $(1)): puppet_$(strip $(1))
	docker push cyberious/rspec_puppet:$(strip $(1))
endef

$(eval $(call dbuild, 4.10, 2.1.9))
$(eval $(call dbuild, 5.3, 2.4.4))
$(eval $(call dbuild, 5.5, 2.4.4))
$(eval $(call dbuild, 6.0, 2.4.4))

$(warning Warning: $(TARGETS))
all: $(TARGETS)
