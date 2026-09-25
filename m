Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F444A40A
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375114; cv=none; b=MOlCMcvRqlxp4haV/NfyZyUczP5eSfXZkEhtyhsxqYDY0pOIIL9pWVBnk9hshLZq7Ns7y14o7wi0Lyw2thFh/h8cCpXuEHTucg4uTJGylvTc6H1Gg7vsdi04tEZd0hzqpbHzFzJTftj9tEh75sdt8876NIgvQdizUzutwzxm38A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375114; c=relaxed/simple;
	bh=GDeXdSeJpVgYicAOQq8v0rIzJI+14w0uEWZNeqQdcjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9BvUWOOGoZYNTx0O4cPm7D2vWaU2CwrwkZ23V0WJTe50mDA1jJ8HHZqGJ+4QKPex6Rd7uUrBF99dtK0zK8O4xtghA7TpxZpcldFoB5lWy/hmMRbEwhUVtpjPRPA81VuB30YzKz5vJ2V6MZBNdf+phHuP/NHVIIpCe5547D9PLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojpLrqEt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojpLrqEt"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 979721F000FF;
	Fri, 25 Sep 2026 22:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790375112;
	bh=EINPiDT5feEaqOVb0PITJczTkN1kq1f/2VOx15jmW+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ojpLrqEtTw7gVqUUYIMPdNB1mylRjJNhMC60mQHRFtP/iuM4D9qetMsrK2X0fGQ0F
	 h2ftz0bdXcqPpVlLavHApRT/LQ+EfyHz63OjzCdCJ6Ve6D8ZgygT/GRIEGWyMn6K0m
	 +x7xQTYeYYxMWdSIEAusC2Uhsl+ji67hRBJA+qOcIWYSayIBCBEHLTw4+hIcZlapkP
	 tGQ8nxXeXkvMDysFy3h/awLWb4mTudBLbb0BjkKr68B5VVkNqQEYQlptAHj96SsuTz
	 nxN1UY4SU1RRSiI9bRhdgTrg45x5Sn7AQDCNyXrHfrWGytAZ2CiRUqeZ+jpCr9ORvO
	 Il/POe55Rgaaw==
Date: Fri, 25 Sep 2026 15:25:12 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 09/10] test: mount the service examples through
 fuservicemount3
Message-ID: <20260925222512.GW6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-9-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-9-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:37AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> No test ran service_ll, service_hl or null in service mode. No test
> checked that mount.fuse3 mounts through a listening service socket, and
> runs the filesystem program when the socket refuses the connection.
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

These are a reasonable set of simple tests to make sure that service
discovery and startup work correctly.  Thanks for writing these tests;
I suppose I had become over-reliant on testing all this via fstests.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  test/cases/lib/service-example.sh      | 62 ++++++++++++++++++++++++++++++++++
>  test/cases/mount/service-hl.sh         |  7 ++++
>  test/cases/mount/service-ll.sh         |  7 ++++
>  test/cases/mount/service-mount-fuse.sh | 31 +++++++++++++++++
>  test/cases/mount/service-null.sh       | 33 ++++++++++++++++++
>  5 files changed, 140 insertions(+)
> 
> diff --git a/test/cases/lib/service-example.sh b/test/cases/lib/service-example.sh
> new file mode 100644
> index 000000000000..878b379b8b16
> --- /dev/null
> +++ b/test/cases/lib/service-example.sh
> @@ -0,0 +1,62 @@
> +# lib/service-example.sh - body for the service_ll / service_hl cases.
> +#
> +# Caller sets FS_NAME and LAUNCH before sourcing:
> +#   FS_NAME   service_ll | service_hl
> +#   LAUNCH    fuservicemount3 | mount_fuse
> +#
> +# The file the example serves has to read back as the image, and what is
> +# written through the mount has to reach the image.
> +
> +_fuse_no_mount_needed=1
> +. "$TEST_LIB/common.sh"
> +
> +# Before the gates: a misspelled FS_NAME would otherwise skip as "not built"
> +case ${FS_NAME:-} in
> +service_ll | service_hl) ;;
> +*) _fail "unknown FS_NAME '${FS_NAME:-}'" ;;
> +esac
> +case ${LAUNCH:-} in
> +fuservicemount3 | mount_fuse) ;;
> +*) _fail "unknown LAUNCH '${LAUNCH:-}'" ;;
> +esac
> +
> +_require_linux "fuservicemount3"
> +_require_root
> +_require_fuse_device
> +_require_binary util/fuservicemount3
> +_require_binary "example/$FS_NAME"
> +[ "$LAUNCH" != mount_fuse ] || _require_binary util/mount.fuse3
> +
> +. "$TEST_LIB/service.sh"
> +
> +service_setup "test-$FS_NAME-$$"
> +img=$TEST_SRC/img
> +old=$TEST_TMP/old
> +new=$TEST_TMP/new
> +
> +# The size has to be a multiple of the page size
> +head -c 1048576 /dev/urandom >"$old"
> +head -c 1048576 /dev/urandom >"$new"
> +cp "$old" "$img"
> +
> +service_start "$TEST_LOGDIR/fs-$FS_NAME.out" "$FUSE_EXAMPLE_DIR/$FS_NAME"
> +case $LAUNCH in
> +fuservicemount3)
> +	"$FUSE_UTIL_DIR/fuservicemount3" "$img" "$TEST_MNT" \
> +		-t "fuse.$service_subtype" ||
> +		_fail "fuservicemount3 did not mount $FS_NAME"
> +	;;
> +mount_fuse)
> +	"$FUSE_UTIL_DIR/mount.fuse3" "$service_subtype#$img" "$TEST_MNT" ||
> +		_fail "mount.fuse3 did not mount $FS_NAME"
> +	;;
> +esac
> +
> +_assert_fstype "$TEST_MNT" "fuse.$service_subtype" fuse
> +_assert_file_eq "$TEST_MNT/single_file" "$old"
> +dd if="$new" of="$TEST_MNT/single_file" bs=64k conv=notrunc,fsync status=none
> +
> +umount "$TEST_MNT"
> +service_wait_exit
> +_assert_eq "$service_rc" 0 "$FS_NAME exit status"
> +_assert_file_eq "$img" "$new"
> diff --git a/test/cases/mount/service-hl.sh b/test/cases/mount/service-hl.sh
> new file mode 100755
> index 000000000000..6db3add3a5d1
> --- /dev/null
> +++ b/test/cases/mount/service-hl.sh
> @@ -0,0 +1,7 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +
> +FS_NAME=service_hl
> +LAUNCH=fuservicemount3
> +
> +. "$TEST_LIB/service-example.sh"
> diff --git a/test/cases/mount/service-ll.sh b/test/cases/mount/service-ll.sh
> new file mode 100755
> index 000000000000..036553889f7a
> --- /dev/null
> +++ b/test/cases/mount/service-ll.sh
> @@ -0,0 +1,7 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +
> +FS_NAME=service_ll
> +LAUNCH=fuservicemount3
> +
> +. "$TEST_LIB/service-example.sh"
> diff --git a/test/cases/mount/service-mount-fuse.sh b/test/cases/mount/service-mount-fuse.sh
> new file mode 100755
> index 000000000000..6bc95240c772
> --- /dev/null
> +++ b/test/cases/mount/service-mount-fuse.sh
> @@ -0,0 +1,31 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +#
> +# mount.fuse3 mounts through the service when its socket listens, and execs a
> +# program named after the type when the socket refuses the connection.
> +
> +_fuse_no_mount_needed=1
> +. "$TEST_LIB/common.sh"
> +
> +_require_binary example/hello
> +
> +FS_NAME=service_ll
> +LAUNCH=mount_fuse
> +
> +. "$TEST_LIB/service-example.sh"
> +
> +fallback=test-fallback-$$
> +service_setup "$fallback"
> +
> +# Bound but never listening, so connect() gets ECONNREFUSED
> +python3 -c 'import socket, sys
> +socket.socket(socket.AF_UNIX, socket.SOCK_SEQPACKET).bind(sys.argv[1])' \
> +	"$service_sock"
> +
> +mkdir "$TEST_TMP/bin"
> +ln -s "$FUSE_EXAMPLE_DIR/hello" "$TEST_TMP/bin/$fallback"
> +export PATH="$TEST_TMP/bin:$PATH"
> +
> +fuse_mount_helper "$fallback" >/dev/null
> +_assert_listdir "$TEST_MNT" hello
> +fuse_umount
> diff --git a/test/cases/mount/service-null.sh b/test/cases/mount/service-null.sh
> new file mode 100755
> index 000000000000..b89107ae3a40
> --- /dev/null
> +++ b/test/cases/mount/service-null.sh
> @@ -0,0 +1,33 @@
> +#!/usr/bin/env bash
> +# GROUP: mount
> +#
> +# The null example mounts through fuservicemount3 on a regular file.
> +# null has no backing file and mounts on a regular file, so it does not use
> +# lib/service-example.sh.
> +
> +_fuse_no_mount_needed=1
> +. "$TEST_LIB/common.sh"
> +
> +_require_linux "fuservicemount3"
> +_require_root
> +_require_fuse_device
> +_require_binary util/fuservicemount3
> +_require_binary example/null
> +
> +. "$TEST_LIB/service.sh"
> +
> +service_setup "test-null-$$"
> +mnt_file=$TEST_TMP/file
> +_at_exit "umount -l '$mnt_file' 2>/dev/null"
> +printf 'dummy' >"$mnt_file"
> +
> +service_start "$TEST_LOGDIR/fs-null.out" "$FUSE_EXAMPLE_DIR/null"
> +# null takes no source, only the mount point
> +"$FUSE_UTIL_DIR/fuservicemount3" "$mnt_file" -t "fuse.$service_subtype" ||
> +	_fail "fuservicemount3 did not mount null"
> +
> +_check fuse_test_null_roundtrip "$mnt_file"
> +
> +umount "$mnt_file"
> +service_wait_exit
> +_assert_eq "$service_rc" 0 "null exit status"
> 
> -- 
> 2.53.0
> 
> 
> 
