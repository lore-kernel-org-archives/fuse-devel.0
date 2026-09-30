Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22E46D2DA
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804721; cv=pass; b=GNH9RiXay3wlypwuUfVEvTG2hcS7hkWUISyWz+uVqVNCExtgKOs4bqThOmf0130fVqawf5/JU7XyyhPiHWJMc+CyX3G41rJFzn0Eib4NVIhsoXMS+AE6kCJwRZ8FdLygZWXUA0iRd+fVHTvQLiBcA0aMrSeFiQGGmsLjk+yPvkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804721; c=relaxed/simple;
	bh=PiF+5JhYQyqyQQg0yIhizhLY5K8knHwjm64JM2eQzDc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=u35UusURQS0FQrsbDuFjJ+NxGrIagk03MYrDPIML+c/nU4BzQGukEAps8S+erc7JiYSSmQq2YqNKAn23M91iLUHwASvqi7kiXLLxL6fwD33JgsSN6UsD/eg9WC9+wrYMpXemkLi8QciM6xK+Ht325y9KUnY5HGayKSl1Lwmdyjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr41zmm9; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr41zmm9"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae3a72e02eso369494a12.3
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 14:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790804718; cv=none;
        d=google.com; s=arc-20260327;
        b=RCdmICkagc1XddBIPHGy4rGkJo019cNoV7wDU2GNFszKvZPG5J4HZkzPYl2vNHmRyf
         PGKBo50fEQnPaD4v/dKOetswoOfJo85nIE4zcqP7/2mCeCHqQi+X4hN57VqZBIDOvSgr
         wxdDFzA57G0a87nSyNwh5WVweTg2AEuCwc5a7CjUmsS2QV7pAzXpeHMrTy/xu4r5b9SP
         9UML1+Ek8Ju7gKK7Js1Tb5RvE2NPxvS4uOTU92XNBmPZn6t7eHVMbcbd3ZgCEOW4p7xG
         ishWQOacStFEbKzImOxis6vfYJTtjGePk6K52qsE3VhdqWVj1hgeKKyUCq9zK8wdeeeV
         nrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=TmzptZmFD4kymUTncO9Qq9vTT/IrpfVRobSN1GvypKQ=;
        fh=bUc84UNDkcYOkHCYNDW7prlh/3lzj0+Y+iFBl/jos2o=;
        b=Y6Ax6IcCUQbTYSIVnKIosBOVBj4ZfiWjibG3VgFyG/Y9ZQUbOi+SyjM0kdtQD4XjMD
         O5Er9DgwLF5PQIQfkGR1T58aZxNcRe7XzaNxDBxHnfIFmTuKWYylLBlsz8QsUP/tFurU
         WRns5mc1aOXFh16FNfRGSvALOtJtbWl5pRy27z2VQBlqbXmvdkYIVVdxjGFkz6rtq1C3
         BqLtgQAskhFCIloKyD2UFHLs0BuE8GWlCEhtKpFac/d/BW64rZttPYIfPXPV9F49N+5t
         5XGZu6kMsyXKBtxuFfRbU83GS2uRWpGVY1ebwz/pQimTk2IWpn6AKNfmMrKBj4vtjwfo
         LpGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804718; x=1791409518; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmzptZmFD4kymUTncO9Qq9vTT/IrpfVRobSN1GvypKQ=;
        b=Hr41zmm9KNS7/iATWwajJBu5gLvT3K3q2lx2gcXSr0TlSGL95hdaghCcUTd3rQi76A
         1oToXjd1e4WjTdhUy3IQwLbMAfXq/glKBf7jcOO00gXrSxLEsCDgzrqx9Ktaw+NxieYL
         jAjDaCmQj+YdVYu3QIrGz+u8QwTb8aaxvZchf3reN1+pphp8qLQnryi3x9U8sPllQKpv
         FWEvVAPBwrv09KZ1zuk9g7JgzBcabvcwZg69XryV6E/gKuBJRJiWLn39ffLo1JBoReZa
         KD5hJ2HW9gkZbYVHlQhVF9qZm0BrezVBcu4h80J7Fm2eCsUMt62fzT0ZeOdm4Jz8S90o
         ikPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804718; x=1791409518;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TmzptZmFD4kymUTncO9Qq9vTT/IrpfVRobSN1GvypKQ=;
        b=ZMnYs0PM0ERVqmMqTrRgmig9L7PmS3xq92oav91bYIxdvbx5LovTcCByEXIVypjB05
         NsdlLMuxseC/KebFH0g8ZoJAFiIWBRHDBlN2MhcpW5D5guxLHSxaOh3uDQbmrah0A6kr
         NqWUOd62XiGsUs46cGdns+LVhzdldY7cKYP1Bv7XKS93+lU70isFsupQflIp3SIE6cOy
         SS7vFqVmR2qIevmvFKw48Tg356ooLIu/T3/nq8/bmeenBStO7RqE303DbzP6l79KeBj4
         T2W/FmU/Ud7Y9UEQ3qWWnuDz7vu5EgkO5QzN4eyptEQpx+sxjYkreTxihWLS379IOWMG
         z+8g==
X-Gm-Message-State: AFq9FYK6NFST0CdZ9tZxXtVv3UmKLjplQU9liyDNmpOiFzZikhlRsn7A
	J17vKuU2lVfcWPXbTTRpa4SCTu4XVsKZA3AlEpbxGv2T7ZOc8YqYKy4tWyU+KUiLDTz9NI8Ztt3
	dlQBsMH1BFZ0Ga+/rxgVohupeioiYD8I=
X-Gm-Gg: AYBFou3oXrfEt4o1U6KUbeWTggicSre+Vjxr3q+1oVUlpCBdhAhXnTJmnh7C1nka1dN
	+1AlG36CJoyBnUkBHmrdgXZ9Aj1YLOEQ55BKpnAneNOCYetlv3YJAgpsSS1ItSb7/XSBI7G7UKG
	iRKC2camKvt+jliTWtxGYjbcK4YAq6OqJFZ8loPCQupE6ZaVRewpBCagS+fTSG6OuYoSmgf/w/l
	q4Q1aMX/16/5KB+VAiWdFTE2bl16MhdfWHQekLJtX9UIXQzkplPL1WGBSilsmT+u/eIrIogAvwH
	IqwQvk9EoCw2JWVmlaCw/VeUDcUXyLorcnf+D/ivX7KjnpzOtZxzpit/
X-Received: by 2002:a05:6402:a0c8:b0:6ac:9145:7adc with SMTP id
 4fb4d7f45d1cf-6ae197f807dmr1937264a12.0.1790804717696; Wed, 30 Sep 2026
 14:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mitar <mmitar@gmail.com>
Date: Wed, 30 Sep 2026 23:45:05 +0200
X-Gm-Features: AclHuK_os7J_qSTseF2-q1yDEA54saSmM29NRE0m1E3A45OjVezUpEjaBz0C_XA
Message-ID: <CAKLmikMhOYpGEw6uCqX_Bm0JPEg-4FhdJMNa9+tgtw3-Kf+eZg@mail.gmail.com>
Subject: fuse: HANDLE_KILLPRIV_V2 does not kill suid/sgid on fallocate() and copy_file_range()
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi!

While adding FUSE_HANDLE_KILLPRIV_V2 support to a go-fuse based
server, I noticed that with it negotiated, fallocate() and
copy_file_range() by a caller without CAP_FSETID no longer clear the
setuid and setgid bits of the file they modify, and that the server
has no way to learn that it should clear them itself.

The kernel makes the decision, but drops it on the way.
fuse_file_fallocate() and __fuse_copy_file_range() both call
file_modified() before sending the request, which ends in
fuse_setattr() with ATTR_KILL_SUID and ATTR_KILL_SGID. Since commit
8981bdfda744 ("fuse: don't send ATTR_MODE to kill suid/sgid for
handle_killpriv_v2"), fuse_setattr() drops those when
fc->handle_killpriv_v2 is set, expecting the server to kill the bits
when the WRITE which follows arrives. But no WRITE follows
FUSE_FALLOCATE or FUSE_COPY_FILE_RANGE, and neither carries such a
flag. All the server sees is an empty SETATTR before the request,
which it cannot tell apart from the one it gets when only
ATTR_KILL_PRIV was asked for.

For "fallocate -l 8192 f" run by an unprivileged user, on a file with
mode 06777 which they may write to, the server receives:

  GETXATTR  "security.capability" -> ENODATA
  SETATTR   valid=0
  FALLOCATE offset=0 length=8192 mode=0

and the file keeps mode 06777. Without FUSE_HANDLE_KILLPRIV_V2, the
same command clears both bits, since fuse_setattr() then turns the
request into a SETATTR of the mode. I verified the fallocate() case.
The copy_file_range() case is from reading the code, as the server I
tested does not implement FUSE_COPY_FILE_RANGE.

This matters beyond the mode looking wrong: fallocate() with
FALLOC_FL_ZERO_RANGE or FALLOC_FL_PUNCH_HOLE, and copy_file_range()
even more so, change what the file holds. So somebody who may write to
a setuid file can replace its contents and keep the setuid bit, which
is what killing the bits is there to prevent.

It looks like an interaction between changes rather than a choice.
Commit fe0da9c09b2d ("fuse: copy_file_range needs to strip setuid bits
and update timestamps") made copy_file_range() kill the bits in 2019,
which stopped working on FUSE_HANDLE_KILLPRIV_V2 connections with
8981bdfda744 in 2020. Commit 4a6f278d4827 ("fuse: add file_modified()
to fallocate") added the same to fallocate() in 2022, which takes
effect only without FUSE_HANDLE_KILLPRIV_V2. As far as I can tell from
its source, virtiofsd with --killpriv-v2 has the same gap: it drops
CAP_FSETID for write, open and setattr when asked to, and calls
fallocate() and copy_file_range() as they are.

I think we should pass the decision with the request, as for WRITE and
OPEN. For FUSE_FALLOCATE, a new FUSE_FALLOCATE_KILL_SUIDGID could go
into the currently unused fuse_fallocate_in.padding. For
FUSE_COPY_FILE_RANGE, it would need a new field, or a bit in
fuse_copy_file_range_in.flags behind a new INIT flag: servers pass
.flags on to copy_file_range(2) as it is (virtiofsd does), which fails
with EINVAL on any bit, so a new bit there cannot be sent to a server
which did not ask for it.

What do you think?


Mitar

-- 
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
