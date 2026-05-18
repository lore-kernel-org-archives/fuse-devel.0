Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B19F38D3E0
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 18:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129311; cv=pass; b=nTBntrJEUXl4SrjBLvDWpqHl3XN8n8FgMX4gTYHSULVOkQCJ+iPlbSQfrl+uor+Ja/dbOVxFY7PKgCLl4VZurOeUEAepWsk2zVuQyOzn8o8kpzt06EcvZoJK26Z/n7L3Llc1K9jMrnLOQE7RaK2ziD9nyrdPB9prEQMd/vYyqu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129311; c=relaxed/simple;
	bh=zfBc4eLvgZETNVCwaMjtmiLlWfDM9HXuPjNpKwFyRoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsRBIIroia55AcSVs29tc5kbQ0y5aCuslZlP3ClFKlmEOA9b95ZK4QAaO38fLaknD/w/gb4cMRgcTK6XXw/zSva9ldyYau7Jp7VxkuhCLd/jSZVPJjHyXsQZ/dAWi3r5Cr6kKL7n2R1drxRuf1aOGdnFXUl4o3TbkbJuWGfZakA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KC69U0B5; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC69U0B5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891b0786beso19014775e9.1
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 11:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779129307; cv=none;
        d=google.com; s=arc-20240605;
        b=IVNQwRjjGDpoy22IFJURMTR/iGXGWsXMPevb0BsrplAc8YM2izvgAepO800R7KNPm3
         MYWIBOaUG/CzJt9wEtfEy2VJmkGpC/zudpFuPlZJm3MV+62DFX+aT3hNDXpMlZYQ/OQd
         H7YbR8ntJvwV6IA65E6I5XBrNhtXrMtn0tOJWg8s69RsPCV5BD7ChjMPVE3QVT5s4laX
         yPFtmOavQDi+uskfT+pr5hgziCiC7QnPBxB9ms5g/yqnkkqeQ6rlXHPQF6u2KeT2w5PS
         5muXVD5lcMErFwEairaqjI1LWp50+FdKCrRRWm2fvSb1fD/DEXWkH2mAndJclJMM89F1
         oC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8btY24TAcxNFeMHHWwcrKm/g35Z5vhN3GDcpOLQS4U=;
        fh=Zad13jVNclDGg5YvedXFWv0VS+gbxGf9LxSLc+BBCao=;
        b=VF8elbn9mRlNXj68CflJfW4t93CcMx9Jw65Lt7h7g60yIiIXDjrq2j5Ex5XzO7S8VO
         74dGzly9W5YfyhvrVKdN+JLmWjP4ZaHvj/BAabKT3jJgDGgFARrANwk99p+20O5RtAMf
         yG61QyawUAaMhD0icnG6rN/+A25f+qwYksz/gh5/iVu2JSBCO/4omHrthz5Xc6zjxcnz
         scyQmbLAs6jyLmevT/Ps/+riOPgHOi5PGeEodjaLw/HEezP+Z+NflaqCPbr8VQVDtJN6
         qupWG/6s5kmAe+6KfxkSHq/tGIfa9MUI2IB5cY3VJxMkydULJCrIU08iCRXK+P4e9LHi
         8gCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129307; x=1779734107; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8btY24TAcxNFeMHHWwcrKm/g35Z5vhN3GDcpOLQS4U=;
        b=KC69U0B5BvyDwAmp3TNO0A+YQV2sr4Us4UEMkngrRoVrXERu6iky7h1+mA09TBWI4I
         TaEVg2goK9YyFkAHsBXZVY0hQKrLbYbV0G9MdGQWjfZiZ880yHH8CGzOVwvxZ88YtpPf
         EaihKkZL4sG4yfxyWtWR6JFIE421DIj3OrHOW2vZ4VOLP0fCjT6NAc6O0HuxR5IOI9GY
         BOWuuKVRlKt0y76OZAxFEUZ3PoXstlFw/DPz/KpkdX8fft4TKZkSz3HEg7spn5jVrP6+
         jLjgj8lvqPGp9VmfzoB8vfz80P4I3ujRBAfu7JpIB5WpocWF/DB2WRDn8/IWm4VRTRI4
         vrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129307; x=1779734107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8btY24TAcxNFeMHHWwcrKm/g35Z5vhN3GDcpOLQS4U=;
        b=R0BFaau1zqXdNUT0OdW2WL67iU6jI6IF/kTEAu+q2u/Cz30BlU7u6JifIVP0AAIOGq
         7QrVCiJbb9LwV8NBoFU2mMpjlRpO31V+tYg0fQgNkNA1XKPsFxEj6jTdwIPeZSf8tq+j
         qWf/9bRwfyoj/Wu53CkV9QriIXS40MjLJ3CAug+fdUb+skRUdbCQ0GzK2syc5+lsGROZ
         dsxp8K5OEdSUQuPtcrlAn8NZGwSubhsRsLvpEuPqD5zKEFZgoBxfXhqdT2DNL8Ha+XgL
         3irzjWx7Lo8qnVc/CzoCVxD5pLDABWw/xiWntYzJZpOvBHOAj6d+ieYwAc5BVl1bXEA5
         m6uw==
X-Forwarded-Encrypted: i=1; AFNElJ81opgnYnr1DhQ3e1q6ujAhLqDkp30LLPVOAjZ1eAF60lmkoyR4JiHC7ohlqyXDU7eJvvX+MUkgqclf@lists.linux.dev
X-Gm-Message-State: AOJu0YwehI5FGvgf4HazzN8P+giAzJsBn2UB6UN+sgiX5gci19QA2cHc
	sJFWACTe1hCYxEmIdH5TmQqNuzl1Ted/NH6fG4eAkBbT+fhXystDqDjd3RIpR0npjY6OMOwgid9
	ZZ1Elp5lwIzvATm9TV5+PJUuTUezrJTmj/tP2
X-Gm-Gg: Acq92OHpEqWj15ovkc6/84gIs5SMRvWNPmyUuCtSiUJMsBmGq7FzQOgxP+MYY6GfSmg
	NGMBn8xF/FLd6MZVO2176DDcK0FYwkUkx8YsyuYtKJEEEN9IM7cUDs6S6hR5Ym8HCX+n9LcJyPP
	0BMiku0DTxYHZ9IHVbpskKl+8nZ950EruFbml57DZo4F01KgrXaDt0Pw+AG987cWLRASorB6ofy
	RANlInpy4KHnWot/xYehSjLL8hiCBUA2vP5jXv9XBydlwTekN5HfvBMrsTU9kEpc+ebx6G0OpUt
	8HD3sw==
X-Received: by 2002:a05:600c:3e1b:b0:48d:46a:6e5b with SMTP id
 5b1f17b1804b1-48fe60de6b2mr247664865e9.7.1779129306765; Mon, 18 May 2026
 11:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518182602.3107764-1-vlad.wing@gmail.com>
In-Reply-To: <20260518182602.3107764-1-vlad.wing@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 11:34:55 -0700
X-Gm-Features: AVHnY4J3xr2Gvp52xK2OIEcQt9FQCDBFKVIWkl5crcafzqFIXkmK8ZECoQZjAbQ
Message-ID: <CAJnrk1b9ZDH11+0Eq9ZqkoeiU3t_qxs1SUGTmPUB==gmyENZ-Q@mail.gmail.com>
Subject: Re: [PATCH 6.18.y] fuse: avoid 0x10 fault in fuse_readahead when
 max_pages == 0
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Breno Leitao <leitao@debian.org>, 
	Josef Bacik <josef@toxicpanda.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	fuse-devel <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[adding fuse-devel list to cc]

On Mon, May 18, 2026 at 11:26=E2=80=AFAM Vlad Poenaru <vlad.wing@gmail.com>=
 wrote:
>
> When fc->max_read is smaller than PAGE_SIZE (common on aarch64 with
> 64K base pages if the FUSE server advertises a small max_read in INIT),
> max_pages =3D min(fc->max_pages, fc->max_read / PAGE_SIZE) is 0, so
> cur_pages is 0 on every outer iteration.
>
> fuse_io_alloc(NULL, 0) then calls fuse_folios_alloc(0, ...), which
> calls kzalloc(0, ...) and gets back ZERO_SIZE_PTR =3D=3D (void *)16.
> The "if (!ia->ap.folios)" guard in fuse_io_alloc does not catch
> ZERO_SIZE_PTR, so fuse_io_alloc happily returns an ia whose
> ap.folios is 0x10.
>
> The inner "while (pages < cur_pages)" loop runs zero times, then
> fuse_send_readpages(ia, ...) dereferences ap->folios[0] in
> folio_pos(), faulting at virtual address 0x10:
>
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000010
>    fuse_readahead+0x14c/0x490
>    read_pages+0x80/0x318
>    page_cache_ra_unbounded+0x1c0/0x2b0
>    page_cache_ra_order+0xb8/0x368
>    page_cache_sync_ra+0x210/0x320
>    filemap_get_pages+0x290/0xdb0
>    generic_file_read_iter+0xd0/0x540
>    fuse_file_read_iter+0x8c/0x158
>    __arm64_sys_read+0x1a0/0x488
>
> addr2line on the aarch64 vmlinux maps fuse_readahead+0x14c to
> fs/fuse/file.c:897 inlined into :999, i.e. "folio_pos(ap->folios[0])"
> inside fuse_send_readpages.  The faulting instruction "ldr x8, [x8]"
> loads ap->folios[0]; ap->folios was previously loaded as 0x10
> (ZERO_SIZE_PTR).
>
> Without this fix the function would also spin forever, since
> "nr_pages -=3D pages" makes no progress when pages stays 0; in practice
> the NULL deref masks the spin.
>
> Bail out of the outer loop if cur_pages is 0 -- there is no work we
> can issue via FUSE in this iteration, and remaining folios will be
> handled by read_pages() falling back to ->read_folio.
>
> Note: this code was rewritten in mainline by commit 4ea907108a5c
> ("fuse: use iomap for readahead"), which switched fuse_readahead to
> iomap and removed the buggy loop entirely.  This patch therefore
> applies only to stable branches that still carry the pre-iomap
> readahead path.
>
> Fixes: 3eab9d7bc2f4 ("fuse: convert readahead to use folios")
> Reported-by: Breno Leitao <leitao@debian.org>
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  fs/fuse/file.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 6014d588845c..782178124512 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -974,6 +974,16 @@ static void fuse_readahead(struct readahead_control =
*rac)
>                 unsigned cur_pages =3D min(max_pages, nr_pages);
>                 unsigned int pages =3D 0;
>
> +               /*
> +                * If max_pages =3D=3D 0 (e.g. fc->max_read < PAGE_SIZE o=
n a
> +                * 64K-page kernel), cur_pages is 0 and we cannot make
> +                * progress.  Bailing here avoids passing 0 to fuse_io_al=
loc,
> +                * which would return an ia whose ap.folios is ZERO_SIZE_=
PTR
> +                * (0x10) -- later dereferenced by fuse_send_readpages.
> +                */
> +               if (!cur_pages)
> +                       break;
> +
>                 if (fc->num_background >=3D fc->congestion_threshold &&
>                     rac->ra->async_size >=3D readahead_count(rac))
>                         /*
> --
> 2.53.0-Meta
>
