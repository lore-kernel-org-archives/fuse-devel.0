Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9167C3F926B
	for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196795; cv=pass; b=BYQ1NQ5GitJC3d2NkBTxmgRZMIrhuwGGz2GOA/z7ON+7WOxymJBr8GrFcBu/adqcBXKCERVeVIeG+9wgywhVxjyl213yiHZDvFk8sVyWYP5awirKn4oXGJ9PO/Qwg2yEW3hNjJNh9oC5A2rK0NqukttbofbvBA2RX6A8wMvpHgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196795; c=relaxed/simple;
	bh=/9vGo0nmavtDHHxTO/UOxlUFCFS9hnJACPQkba+EWgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9dgD8Sa5dnK9sc79wegPMucBexNT2/76BHDLUszTQA0HRXCrcWcv+cqDK7QZ7AvsowjY0PaSQvTqfMWE5qJvYJVcQ42ixFgwousOavFgrrC8nSX4WSjnMIeDlsepgNvSvkCa8Pl+ZnWH2GOul0OvZlcxHOGJDdKBrtXx0T/tg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUhOjZIi; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUhOjZIi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de008b020so257163f8f.1
        for <fuse-devel@lists.linux.dev>; Thu, 16 Jul 2026 03:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196790; cv=none;
        d=google.com; s=arc-20260327;
        b=KukEv6fSOJTsidPXUq1hhgYkCIqlMJUGnRHc225Pzr9GNmsdz9Z05YF6Km5s9LiQr7
         rZ2ojjVAk2STU93WlL9g1yDcmyA99cd2DKovO6pWLUtBRBzJdVlci9OJHR7Fkmfi9gUB
         YZcR07IqBWdHCQxRZ7qBicz2pbO8LdPe+ZZpZeU8f9R1PVijoHICaFBfX5Lfmr7CBtQw
         Kxx3TYCdC2eSg8zJlBIDy/wKIQeGGwXQem8KchL1CvYQ63ZP6XWPqVCq4dPgJGc2PW32
         Jdg1VYLdSIPlr2HTTWWHcyWTO6wHNqKLOR9M8/xc+lA2giqCM7hrCxoG71ZzDlAYWzkl
         2xUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0gYTRKSMZ6a4wFC/UrH2Lbf5sG7BiHCm8zMFzcg/FqU=;
        fh=3gdo/mzmJ5VEQB6dtFQW0QoOgvQBhvaz0oTcWrRtIBo=;
        b=ZvWXFdXB3LRLTKJot3jDa93jZcCqJMTZbz5n3GpWtCAcJQ8KTBjmkX1ZSJmadftVmw
         Jc3uJpiBbeV9nfSJltYx/S9Tgq7RVWPLubplZbvFsa3lmYPxhOL0Um1AGyQ5h/uivJYK
         MFj5DRO33qJZodR7fuSOCblIqa7icM95DryYHzs+s9Uj01ZQJrgZQsmmW+bpI2/FuTLD
         veasc/teOJbyfHZOJUG2HbtODphbWBVPbGoiA3GsL8oxxrNltSbT4mdTnNflb1z1FCo6
         sETGJLuBK/NshnOLgTE6hdGDBAjQDh+A4s113UzGpxZYBKvJAK0ZmzN7zJr2BMRhIEIt
         8jKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784196790; x=1784801590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0gYTRKSMZ6a4wFC/UrH2Lbf5sG7BiHCm8zMFzcg/FqU=;
        b=sUhOjZIi3cDOxPWOr2FDfaJWSVJCJIGo4hNqulCyXPrdGSCoQl/XhdqWjCw/sDEPlh
         SyyCxvPs3zGptugtoB5SnNTXsLnmtXRqX4QYsVwAV5wp1cNH7KsdoS4fbgaV7rSaxAy1
         UPrvfJzA7EC0yYDaVmbS7gwZroyWqyhNbilhn5xihQ304C8z3wrEccUsyUm7fJ0H8U7I
         loUmaWU448X9eGuYKuuUcIiODQ0tvwLFHI3O1/YMGekcfu2JsgtUBngrtugqMh+9nMN5
         2USLvf4Zn6yE+VjyC9G/RtLhpW0z5EqGoczY81UwxFwXAE33zKJiJQ0wyWEsyNpbHE0M
         EijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196790; x=1784801590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gYTRKSMZ6a4wFC/UrH2Lbf5sG7BiHCm8zMFzcg/FqU=;
        b=rbrAoW7UTrI0ZndDh4QiRasksnAle5xiQ3uCGqXHFtMM3KzH/R4msT83kF4aP10Auv
         FhAdpPhFNqU0UU0esL2B6+TgsO1k+lffoQ2WZh9xXMHSjiBLa1VyCUhPHVw7LRBeJksZ
         UlxmQ3nBrHbyNk2LkaSmRwbnWHiixKNOT6B9GqW6hzVkI7jCVL39CarrLeZA4FEdC9X2
         0gOrKKuquCwtQ2JekwByqkLJUgMRmO0Zck07UBlzvdS3T+Z0f9uVs1exX/QTUj3NZpIz
         CK05Azl3SsQIbEqHzqk6jaxt4XiegrVMKL0oMANBSdJZYGn3nH8EFsjJ25RtJQaCiLaq
         KZNA==
X-Forwarded-Encrypted: i=1; AHgh+RpvFK85HLO/hw7QBZxjN/K6t0uVrt/gsTFIWgiYmQqHZ5UkJf+A6TbTeAt1cxndyOews0FksO3UkmjI@lists.linux.dev
X-Gm-Message-State: AOJu0YyIlfR6aVCLJdhx7NQHmuy6o9//VgYmLwnJH+4mEfIuIKkpTQf6
	cljwOqa3mHqoycATXCx13DyD2AY07FolTdWYTSLEe3RE1UxXTsMZRSQuMKkXEarRSAtuVLyTx3G
	WLfPZOtCCG1KZroj/vTdgltCwRlmsVhY=
X-Gm-Gg: AfdE7cmgO/AJhLnCPDd4DOYH4XzpSUIm2FC15WXpPmKniBWdgyvX/ZJJNzcGH9RH3s8
	yw9XzThJSU1HMx0fJbBbc+nAsRrWJ+PGDxKl3sijisobXusbDsA62FP5RUqvl35jVHRlR1nKO1o
	vvgO88Mg677qCFcPSxwhRlzW5exEU8XU+3xwDyQti/66iM00RjkaCnQa+zGwd2LQyO0AEt+7EgJ
	5XTTWyU/Ahg1tn1q2mmoP+OgrGxMatgDrSZ1Nv4ZVu5aQdkzpoCBZr2n7vhUoc=
X-Received: by 2002:a05:6000:1acc:b0:472:3090:d88c with SMTP id
 ffacd0b85a97d-47f5a557550mr2382202f8f.24.1784196790209; Thu, 16 Jul 2026
 03:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713220932.413004-1-amir73il@gmail.com> <20260713220932.413004-3-amir73il@gmail.com>
In-Reply-To: <20260713220932.413004-3-amir73il@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 Jul 2026 12:12:58 +0200
X-Gm-Features: AUfX_mzXKKyPECDpxtr7aH47OhobPNkCrTgnnp8wyafWqJnPsgum1B0ttIWoL90
Message-ID: <CAOQ4uxhO-eJ=QU_okX0y8TgjZcn1-UnB-myNawmXLk2ACjOieg@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests/fuse: add ACL_DONT_CACHE regression test
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:09=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> Add a test that reproduces the stale ACL bug fixed by:
>   "fs: preserve ACL_DONT_CACHE state in forget_cached_acl()"
>
> A FUSE mount that does not negotiate FUSE_POSIX_ACL initialises inodes
> with i_acl =3D ACL_DONT_CACHE.  Before the fix, calling
> forget_all_cached_acls() (e.g. from fuse_update_get_attr() on a
> statx(AT_STATX_FORCE_SYNC)) would silently replace ACL_DONT_CACHE with
> ACL_NOT_CACHED, enabling the kernel ACL cache.  A subsequent getxattr
> would populate the cache, and because fuse_set_acl() skips
> forget_all_cached_acls() for !fc->posix_acl, later ACL changes were
> not visible to callers =E2=80=94 getxattr returned stale data.
>
> The test mounts a minimal libfuse3 lowlevel filesystem (no
> FUSE_POSIX_ACL negotiated) and:
>   1. Issues two getxattrs =E2=80=94 both must reach the daemon, proving
>      ACL_DONT_CACHE suppresses caching before any trigger.
>   2. Calls statx(AT_STATX_FORCE_SYNC) to trigger forget_all_cached_acls()=
.
>   3. Issues another getxattr (populates the cache on a buggy kernel).
>   4. Switches the daemon to a different-sized ACL (ACL_B).
>   5. Issues a final getxattr =E2=80=94 expects ACL_B (44 bytes) and daemo=
n
>      call count 4; a buggy kernel returns stale ACL_A (28 bytes).
>
> fuse_acl_cache_test is only built when libfuse3 is detected via
> pkg-config.
>
> Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> ---

> +static int do_force_statx(const char *path)
> +{
> +       struct statx stx;
> +
> +       return syscall(SYS_statx, AT_FDCWD, path,
> +                      AT_STATX_FORCE_SYNC, STATX_BASIC_STATS, &stx);
> +}
> +

Christian,

If no other comments require me sending v2, please change this to plain
statx() on commit.

Thanks Luis for pointing this out.
Amir.
