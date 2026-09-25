Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68463AB28D
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375273; cv=none; b=ZpanOZq2/eOBVEQ2wUyDzefDK2KwVKt/Msc41pKz69DC+cqmMj4axK1AGyNpT+M6rVONnjxhnO1nhYNS94UzhcZVax8Qo1aMfl2MFWrIyFGwYmSnDi6PotNba7qd4U0HV+BL644MK/uN4wU0LqscGeGg1ivh4Rp8KRUE7LKTif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375273; c=relaxed/simple;
	bh=jDl3T48jLRT0A9VsxLhD1GvamqI9gTSKAyo+KEAZ/ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Edph7+n3TchoFWQ4jn8Ha4FY4FYWBTMmpo1DVtUWZ82k9halQanebJ2e3uVinh7FJeeSth8ty2ARl2Fg+HVNC0jSMwPTLgY9Bi5Kwia6lCbzbrIc05GcmDNPFYo9jSl8aGYS6HND7xRfJ2JBmBHfgVdweN4KZ6ZfC0rnBlNK3wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqJDnAv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqJDnAv7"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5965D1F000FF;
	Fri, 25 Sep 2026 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790375271;
	bh=Pw7m9W6gtJYzFGBZ1rpgufYBaW7IqxQFpfQnubBSHGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QqJDnAv7zyr9Wxm+fDfTqZ+RMEdj2siMxvNp8Xl/E1CzUB6V8RHKDXwzod9gzXTAm
	 TpBF1jUyBafJ72oua6YlZXyYSVKW40RnF/zGv1UKshYgwHOmt1syOaB2DeVYoaze0g
	 iVFyXc5mfo7XJYpsSX1+/5kPI3vpKP3pZMl5NIJRgEW0P0DN6Ln9aJbcYQPQtMJyE1
	 UGdMQtDCEW4gUrtJfcRPr6ibb9FvYL703somHIyY1YHbveZND1TTnImUkzfj+7/DKb
	 7h3lnHln3JwnY6HjuuDGzI6FeeHt1CtyyquvoqjXtL1/5RThYlEtwln7hSYQtUw8gT
	 bxWVYsW6+RN6A==
Date: Fri, 25 Sep 2026 15:27:50 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 10/10] test: run mkfs.ext4 through the service examples
Message-ID: <20260925222750.GX6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-10-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-10-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:38AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> The byte comparison in the service example tests does not show that a
> real filesystem tool works on the file service_ll and service_hl serve.
> mkfs.ext4 writes a filesystem through the mount, and e2fsck checks the
> image after umount.

Ooh, a file IO path test too!

> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  example/service_ll.c                |  5 ++++
>  test/cases/lib/service-example.sh   | 54 ++++++++++++++++++++++++++++++-------
>  test/cases/mount/service-hl-mkfs.sh |  8 ++++++
>  test/cases/mount/service-ll-mkfs.sh |  8 ++++++
>  4 files changed, 66 insertions(+), 9 deletions(-)
> 
> diff --git a/example/service_ll.c b/example/service_ll.c
> index fd43c40fc15b..7baf47905a33 100644
> --- a/example/service_ll.c
> +++ b/example/service_ll.c
> @@ -43,6 +43,11 @@
>   *
>   *     mount -t fuse.service_ll /dev/sda /mnt
>   *
> + * /mnt/single_file then holds the bytes of /dev/sda, so a filesystem can be
> + * created on it:
> + *
> + *     mkfs.ext4 /mnt/single_file
> + *
>   * ## Source code ##
>   * \include service_ll.c
>   * \include service_ll.socket
> diff --git a/test/cases/lib/service-example.sh b/test/cases/lib/service-example.sh
> index 878b379b8b16..4d7e0b27f3b9 100644
> --- a/test/cases/lib/service-example.sh
> +++ b/test/cases/lib/service-example.sh
> @@ -1,15 +1,19 @@
>  # lib/service-example.sh - body for the service_ll / service_hl cases.
>  #
> -# Caller sets FS_NAME and LAUNCH before sourcing:
> +# Caller sets FS_NAME and LAUNCH, and optionally CHECK, before sourcing:
>  #   FS_NAME   service_ll | service_hl
>  #   LAUNCH    fuservicemount3 | mount_fuse
> +#   CHECK     bytes (default) | mkfs
>  #
> -# The file the example serves has to read back as the image, and what is
> -# written through the mount has to reach the image.
> +# bytes: the file the example serves has to read back as the image, and what
> +# is written through the mount has to reach the image.
> +# mkfs: mkfs.ext4 on that file has to leave an image e2fsck accepts.
>  
>  _fuse_no_mount_needed=1
>  . "$TEST_LIB/common.sh"
>  
> +CHECK=${CHECK:-bytes}
> +
>  # Before the gates: a misspelled FS_NAME would otherwise skip as "not built"
>  case ${FS_NAME:-} in
>  service_ll | service_hl) ;;
> @@ -19,6 +23,10 @@ case ${LAUNCH:-} in
>  fuservicemount3 | mount_fuse) ;;
>  *) _fail "unknown LAUNCH '${LAUNCH:-}'" ;;
>  esac
> +case $CHECK in
> +bytes | mkfs) ;;
> +*) _fail "unknown CHECK '$CHECK'" ;;
> +esac
>  
>  _require_linux "fuservicemount3"
>  _require_root
> @@ -26,6 +34,10 @@ _require_fuse_device
>  _require_binary util/fuservicemount3
>  _require_binary "example/$FS_NAME"
>  [ "$LAUNCH" != mount_fuse ] || _require_binary util/mount.fuse3
> +if [ "$CHECK" = mkfs ]; then
> +	_require_prog mkfs.ext4
> +	_require_prog e2fsck
> +fi
>  
>  . "$TEST_LIB/service.sh"
>  
> @@ -35,9 +47,16 @@ old=$TEST_TMP/old
>  new=$TEST_TMP/new
>  
>  # The size has to be a multiple of the page size
> -head -c 1048576 /dev/urandom >"$old"
> -head -c 1048576 /dev/urandom >"$new"
> -cp "$old" "$img"
> +case $CHECK in
> +bytes)
> +	head -c 1048576 /dev/urandom >"$old"
> +	head -c 1048576 /dev/urandom >"$new"
> +	cp "$old" "$img"
> +	;;
> +mkfs)
> +	truncate -s 64M "$img"
> +	;;
> +esac
>  
>  service_start "$TEST_LOGDIR/fs-$FS_NAME.out" "$FUSE_EXAMPLE_DIR/$FS_NAME"
>  case $LAUNCH in
> @@ -53,10 +72,27 @@ mount_fuse)
>  esac
>  
>  _assert_fstype "$TEST_MNT" "fuse.$service_subtype" fuse
> -_assert_file_eq "$TEST_MNT/single_file" "$old"
> -dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync status=none
> +case $CHECK in
> +bytes)
> +	_assert_file_eq "$TEST_MNT/single_file" "$old"
> +	dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync \
> +		status=none
> +	;;
> +mkfs)
> +	# -F: single_file is a regular file, not a block device
> +	mkfs.ext4 -F -q "$TEST_MNT/single_file" ||
> +		_fail "mkfs.ext4 through $FS_NAME failed"

You might consider adding a -D <path> argument to mkfs.ext4 so that it
will copy a directory tree into the filesystem image.  That way you're
testing block overwrites.

That said, if you're satisified with writing just the superblock and
log, that's fine with me too.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> +	;;
> +esac
>  
>  umount "$TEST_MNT"
>  service_wait_exit
>  _assert_eq "$service_rc" 0 "$FS_NAME exit status"
> -_assert_file_eq "$img" "$new"
> +case $CHECK in
> +bytes)
> +	_assert_file_eq "$img" "$new"
> +	;;
> +mkfs)
> +	e2fsck -fn "$img" || _fail "e2fsck found errors in $img"
> +	;;
> +esac
> diff --git a/test/cases/mount/service-hl-mkfs.sh b/test/cases/mount/service-hl-mkfs.sh
> new file mode 100755
> index 000000000000..af552818cd90
> --- /dev/null
> +++ b/test/cases/mount/service-hl-mkfs.sh
> @@ -0,0 +1,8 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +
> +FS_NAME=service_hl
> +LAUNCH=fuservicemount3
> +CHECK=mkfs
> +
> +. "$TEST_LIB/service-example.sh"
> diff --git a/test/cases/mount/service-ll-mkfs.sh b/test/cases/mount/service-ll-mkfs.sh
> new file mode 100755
> index 000000000000..9908937010de
> --- /dev/null
> +++ b/test/cases/mount/service-ll-mkfs.sh
> @@ -0,0 +1,8 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +
> +FS_NAME=service_ll
> +LAUNCH=fuservicemount3
> +CHECK=mkfs
> +
> +. "$TEST_LIB/service-example.sh"
> 
> -- 
> 2.53.0
> 
> 
> 
