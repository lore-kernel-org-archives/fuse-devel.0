Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3E53E2ED
	for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180642; cv=pass; b=VQJioaZ9HKDlLEiKZ2yZikEzC/VeadZwCxZ6Tv8SMXv+khSxvuvaPfvfl30sw6460DXGFdgCuPlKPMDHLiKk5n5D6MpoY3WYYtqBQeWuKxcMKuiUdd648Mrz5GmAZ8pgUtfhM2YMAEGVdSZzIFlsWnBJPWNHLr7rwZg7jm0NFNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180642; c=relaxed/simple;
	bh=2Oteq2LQAfmMQohvmzQdfax4JBAWgMtdwlOqmBNmox8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6sDnPuS4Ttzsu8Ikpfz/CT/4ejGIOwqp8iqikax8ue7lLm2iQEKadMPIFDGEl1TtxQX+DMKaDY0XhGb/O1zn/V4NXaP+fFM01zmVtJcVNyOINw7DQa6V3cF/Ap5yg3LmTAVhiW4aGTCdy8XftpbbqKe4dt3tYkXp1JYwxAt834=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YzDFT1D0; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YzDFT1D0"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52faa58bff5so282401cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 23 Sep 2026 09:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790180637; cv=none;
        d=google.com; s=arc-20260327;
        b=kbpihj62kRg/zt663DoxBdj6FK8jxpwDMzre5YdWIQAcKXSkb3gKQat7LZZQo9nyHB
         ZfKaDC4jVEPjWIlx8WJawMb97SUJ+xT2AYnfQ1gqL/JJSLktW+FSrlMZEMANs4lz6KUP
         0K0XKaPuME6FCCLyt8ovQovy7D4aSse61xL55Fox5lEEktjB0OEOuhREZ7OPTMQXjyXT
         tDsudJT9w1P1cqWGb2u6bzja+H7MFYxOIa+kphDzAan1PXOkXN7wOI6Wy0HFOYlif5YG
         cLgadEPDmUaoV0EAWFXs/nz93K08xzZhVla71VufC3mvXZ2mAUY6dY5v6dNakXLuiYt2
         JvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        fh=PSnIJyh4xlpz0P15gHdqUZtFQzS0eUN5DoXegnXa2Qw=;
        b=KMeNfQALHDk3zreJ165xX5jWnp0TEfniDzqnPIlHK5SgFrlbgm1+I9/veEqzFr8hVd
         Np245WrUAfAteerNnvwtT0Q/VggmyZFLuPl2P1pSFMzWNZevTIOPdI6Kw0zVi+H0gyDC
         J7Rk95K7K1NM2tnChQO01JH+/a/cAmJSosnaW3ibl9cZbe3ZEOBYE2roL8uAeAKrdtGq
         NE3ASOyO6ex8WFknkC9pT1zjA+YswjJot/r3Cb1fjc2hyCK3Ky4c9MvDcGROscUr/6N9
         AGPVHr8y7w7u6T1bzgINJCM5Bnb6mlgsRn0vVAwsciDtf1hxKbbNhJnKiM6wJAOUClDy
         XOsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790180637; x=1790785437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=YzDFT1D0ykJlgTwp0UpNcJIe6bUn02SPRfCRwr1KUChU5wQNjGKQQ/SDNUV9LPf97+
         3zOz6xBDYosLd2eIbz6Axf1uzvgOTY4ofIQsuJ02WUQLsDPmm7tqittdM0pT7FJQkuFN
         EXEi3XC03IH6v+TTEv4qUt8sFRt51/vIdmotxANf4Ew4s8plsSUr+Ivj5GqLj+uBsjAL
         d/OuaLEX24Otu/Cib3i6N7Z6o9FBpEzuqr+nmgqE/Esty56L21ZDn8KF4getdr10iD4b
         L+XrPMHka7AZROW1YhxlnxDxucE42JD5g6cQocCvQ10cbQtvzk0GzKDkFKPKZNohtBa8
         aeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180637; x=1790785437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FzOqkymgnKp+HaLHwhofGZjaEcw2lbzuDYsddlgiEM=;
        b=sEtXf/z8tZfw3KmNAitP/gX0d1Lb44s8s7jUSsEBW1hvRfJdi9Y0TIf7tAfgzG41Nf
         eKDpD7MK67cuUXwq1Ii5Tb/OpWTQwOLBZU8piK4AjUkavIaLxZmuKy/DAlu7UbGdo/qo
         PahNVVFriHI2HWqNAjILQUCnltoXCydrwks2CKr3WmUpELOIStET1sHPyR8ZTLdjhLp2
         GHbKxaERYiZNURZxPed8Nern9LJ5a97IrFNID4jBd4aKK29VoySldCIfekOIWrxYjt0J
         4Gszy2FaRTRPknsaKkaYkqTpPIhR6Mp/XjyutauoBw+KQdG1sOO00q5TmpvIyH61Qfij
         XlTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSIb89kCwBGQb7ihpSDzCuueCV0efBUfMeVWz/GZRFQ4XhHAhPnSX245Msq+/iQVltGxDjLNShAP0M@lists.linux.dev
X-Gm-Message-State: AFuF++mdhhh+cLWExmjc2CfnN27C6BTqsS/VCzCPWCO5dYpPXf2eB8DY
	bFRDMJUX4tVoVVTDQgLbBOUgsR8q014DONSIJLf0TomO82ihL9pIyKJY/eBh+keZO80JlzfwodW
	sH+vzDu4zIOVcanomX+JMdrIFfSl8CO60pAepve6J
X-Gm-Gg: AYBFou2zlk2+LWoHfmAoxhOuD99iFB4IO0sh6F8fre1CSgSmRojSPCWXhPxxqcI/rL6
	KeMNuF9RU/NowgGDo2f47iEyCKelpsCbmJAFmBfldtdIqVrRtLSUs0w8WxKu+rF6nblfO63pq2O
	AOJF3cEEIgXRMvIXwVQS6n4y3Ml7VzNBXb04xOL7XOaQuPXuoIYdpwVP6lX6iiYTb3StIX4iQE7
	Nx8bB4YTosvA22Fz7KOTdc0EFV9b4QZE//bqRxHj3UNJRJqgR8A3oZsQWK3FoWKlCTUGt88hHni
	DfO97qISg40uRkdV4X6TDdItsECawS0VEdYfkKU31i6kwKGIeDlL3ZeG7Q8SI7bQvg+FswRNu0a
	Wvp6eVe+Ssw==
X-Received: by 2002:a05:622a:609:b0:531:282:6560 with SMTP id
 d75a77b69052e-532f9d4a86emr439391cf.15.1790180636277; Wed, 23 Sep 2026
 09:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-3-4583d8a23bca@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Sep 2026 09:23:45 -0700
X-Gm-Features: AcwNN1U-1rGp6GFHFrF0qqhOHTzivX5krrdmfBch0hMHABT_yaCwm6D93D-Dyz8
Message-ID: <CAJuCfpE0WCr1Kp=+4EVJB7UdbH22HuCouOEtGMNCL+a8TnCQPQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/40] mm/vma: introduce and use vma_[flags_]can_merge()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:24=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Replace the open-coded VMA_SPECIAL_FLAGS check in the VMA merge logic wit=
h
> two new functions vma_flags_can_merge() and vma_can_merge() and update th=
e
> merge logic to use the former.
>
> This abstracts the check and expresses it in terms of the desired behavio=
ur
> rather than an arbitrary and confusing VMA flag.
>
> This also lays the groundwork for making further improvements in VMA flag
> usage.
>
> Also update the userland VMA tests to reflect the change.
>
> No functional change intended.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/linux/mm.h              | 21 +++++++++++++++++++++
>  mm/vma.c                        | 19 +++++++++++--------
>  tools/testing/vma/include/dup.h |  5 +++++
>  3 files changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 969594074fd2..68250ece4219 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1612,6 +1612,27 @@ static inline bool vma_is_shared_maywrite(const st=
ruct vm_area_struct *vma)
>         return is_shared_maywrite(&vma->flags);
>  }
>
> +/**
> + * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to =
be
> + * merged with another?
> + * @flags: The VMA flags to test.
> + * Returns: true if the flags permit merging, false otherwise.
> + */
> +static inline bool vma_flags_can_merge(const vma_flags_t *flags)
> +{
> +       return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
> +}
> +
> +/**
> + * vma_can_merge() - Do @vma's flags permit it to be merged with another=
 VMA?
> + * @vma: The VMA to test.
> + * Returns: true if the flags permit merging, otherwise false.
> + */
> +static inline bool vma_can_merge(const struct vm_area_struct *vma)
> +{
> +       return vma_flags_can_merge(&vma->flags);
> +}
> +
>  /**
>   * vma_kernel_pagesize - Default page size granularity for this VMA.
>   * @vma: The user mapping.
> diff --git a/mm/vma.c b/mm/vma.c
> index 4b74b48c29b7..05d2c676672e 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -924,13 +924,14 @@ static __must_check struct vm_area_struct *vma_merg=
e_existing_range(
>
>         vmg->state =3D VMA_MERGE_NOMERGE;
>
> +       if (!vma_flags_can_merge(&vmg->vma_flags))
> +               return NULL;
>         /*
> -        * If a special mapping or if the range being modified is neither=
 at the
> -        * furthermost left or right side of the VMA, then we have no cha=
nce of
> -        * merging and should abort.
> +        * If the range being modified is neither at the furthermost left=
 or
> +        * right side of the VMA, then we have no chance of merging and s=
hould
> +        * abort.
>          */
> -       if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) |=
|
> -           (!left_side && !right_side))
> +       if (!left_side && !right_side)
>                 return NULL;
>
>         if (left_side)
> @@ -1152,9 +1153,11 @@ struct vm_area_struct *vma_merge_new_range(struct =
vma_merge_struct *vmg)
>
>         vmg->state =3D VMA_MERGE_NOMERGE;
>
> -       /* Special VMAs are unmergeable, also if no prev/next. */
> -       if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) |=
|
> -           (!prev && !next))
> +       if (!vma_flags_can_merge(&vmg->vma_flags))
> +               return NULL;
> +
> +       /* VMAs with no prev/next are unmergeable. */
> +       if (!prev && !next)
>                 return NULL;
>
>         can_merge_left =3D can_vma_merge_left(vmg);
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 16c09dac59d9..2fd422789717 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1647,3 +1647,8 @@ static inline bool file_is_dev_zero(const struct fi=
le *file)
>  {
>         return file && file->f_op =3D=3D &zero_fops;
>  }
> +
> +static inline bool vma_flags_can_merge(const vma_flags_t *flags)
> +{
> +       return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
> +}
>
> --
> 2.55.0
>
