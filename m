Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC44503F3
	for <fuse-devel@lists.linux.dev>; Sun,  4 Oct 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135814; cv=pass; b=OldtzU4V4zuZmf5zvmqr0I7MPdR5FKP3FfdbKlbBfTPcpjisFCDqfX69p4DuwRNwKfOcFu3nN6saG0cS5E5Y4iNZR4+DCeSP04TRNsG5DXycOiKsLuKUEdzxKHaBVtPuFEGNbYQ7Q7fPnbiOudd7Ed1ReabcKiHCwuJme8mJPIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135814; c=relaxed/simple;
	bh=kLTbSagc0N48D5iLz2IHv2jwZa7qPxl4pR47fwwH0D8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKlgw9QSnCng01agqh76crPE5YeSwag+WO6l/+jWwbZpYPxTNoeqQ1UsvCVksJamOXDGrnfh981XT2aWQNHYkdNL7Gwee+HpCjKx8UVBTNXGbqkc06zFoif/ZnljEkLoxk6uuDZNF6kloi+ErlmiZNYBrS8EEULnNovj/UCK/kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a6/JxSB1; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a6/JxSB1"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5351f9dbfe0so95591cf.1
        for <fuse-devel@lists.linux.dev>; Sun, 04 Oct 2026 10:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791135811; cv=none;
        d=google.com; s=arc-20260327;
        b=aWgrY1kSrzG9GoZoEXQD9sqA5h8aYTIICzvb5cq2LYRlBDZLB2roHxXdMu9dZhXxVJ
         gFPAmKnhvKxJW270tb+y6WvEc39Z5SKGX8GqZePCZ5+jinfRotCA22g385zOD+wpEBk2
         6MfpSTlf9VBwuN1MYbhyVWIrA3TPEu99SbhiWJ/YN/0VKGX8/aCJg7ZqSs2b8XTd2obx
         3ILJME0kSQDYBmlfINfheXbJz4zP61AGXcWcstUIx8ROyjMjjU93o6OnQOw4VZAWBDQf
         xjd6WzLKb0IJlEimSwgaskT9mNsu83p0FQ9BZ1iYxbvQ4JWdzadxJE6jiyQiECC4mGRw
         21NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        fh=w7WnR21aKQiMXSHVsrRT76ndG7qy8KwMWP+6MikE83s=;
        b=dnef132JgMAAWciAt5xAv3RfnYp4RyaCByVndTQtNw+rb9GXuNQgmFuc64ZvDxga4k
         OmbL1U4Hh4v08ROs3+nOUXislvXqhKVPx1RQef7nbzb3JAmHDkmmYldp1J+7eUDWSgRb
         AM/h3FthBFEcTORVxyLdJRWy4rJWsbgRkwGo00PUQCggimWzzmcmmLXRhHIn00kPABPh
         wiZAH40E3tlwB92Z/tRHm7w2JJWWIWLsqMymBf0hDEMlsY85jh4ogjmg0uwMzVX+t3kR
         Grfq5/zwChwFKB9MurhK2+ymQkIMxwLMfENLI/UslrVaBlnpW1eidjcx6V77mUPEYFCR
         sBOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791135811; x=1791740611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        b=a6/JxSB1ba0+ZaFtTKmvL3TnJFlrKuTAzvBWiYWnqWrEA67v8qSLEO6NbECZOua1l9
         PdPLiU9Mj+BHCQFuVX+H8QimtHQvKzaF6pae8CKMCtO87ifVwSa5+8Il+cDq1a8WYoOC
         XIUtV3HHMiA9SxSCEQ6D3M7AiRNeLsPTr9S5ol4u+RQVPNm/cm5OUUuf/hddawQ9ZE0U
         HBxVjXDx3ScRlWXXpvhcDdzO+eqQZdPCTyHs42dXoZFPIYtBXZ/vw3OBR+1okQV6zbVM
         C5N6ops25TzMW/bNkNit4qNDt558XKEzqo67XGgKSlB5DuiShzEY/UvJU+S6ygN7mB/N
         FcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135811; x=1791740611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMNQ59LV7QrrLF0PW8JXbsDZwLj1dza/KEaeRbY4SzE=;
        b=VgdM0RCFo+LN1aDdI8L5WibjrSPhmiFbKJhz3oRn1PyPGqPF5XtdKAAheZrkBzQEB8
         kdBy2WKS6jRDykLtirU+MJk4mb0kb3+zA3XlPJPas8lfhNvvWuwUEOGXveNS9TANiTms
         Gt0N94vxqIi38zy6t08VhUMe4kERjiIy8v4qNKUeeNwKNquXEr1QBYwq7RcwBElLnJ4y
         1ZGgtkEKl9kjgirrv1yujSJkHYaS//fa8dW4YsDq5zc/uFPbLFdUT4KHMGktmqmR6rEF
         om0dILrUlTnkNNcJXXnYEabFCuhk+NVYQY2r06+lgWYogz1Wj0T49Ozij0rDpgBdQ0HZ
         Ie2A==
X-Forwarded-Encrypted: i=1; AKwUvBxxzNeriTMcxoppVmYE9mszfXI+DjPIW/zy7lUMn5RoJuH3YL3Hqut7cMg+uZV3N7C0MlsBogpOtr/2@lists.linux.dev
X-Gm-Message-State: AFuF++k9w4c8tdYbSKxrxcys/aXHxbVrnCq9xXh1Co6kondZzozi8cJH
	CN9uKWY7ZDz6BEEWvsMStfHQiiKPGxSg7AYpyCSTc7nCxpD6WbJgkJPcvH1NP0zpNG4OPBuQfSt
	aiBGtMyv2C4IXZKGWv1VW8bjnrXqD2HcaaIFhtfg7
X-Gm-Gg: AYBFou1/L5gAi1ozwZ1nb1d1C2fXUOdGYNvMOdvxAvUf4WisuiVBJqUgxDPAWKWFQ7Z
	MsDjW0WqKwMQRynIbL87zDBcIcvLBOK+g5WPzfvIjjtXZ81aLJkcuHOCIJWnwtrJipeUqJy9Y7U
	04IbPT9+GRnmroJIdVEfUdLJujbaN+qYPU15VVxVx6tTM7z+9mgHnixBdCJgpFqEOh2tHuQaftA
	iPTi+8CRcr2+h1VG2/Lcp5tgik0C5tYyLZkNIyW+iSCjvwJXXk68xoGU31XS4l93z1/vwWM6F60
	CEVl8M0vIrf2d72NTu6mW4qV7KNFZxuVFlL3NnJj1m1p0wzdtFL4YZd1
X-Received: by 2002:a05:622a:5c09:b0:532:eff8:3491 with SMTP id
 d75a77b69052e-5351497bae9mr16844861cf.14.1791135809929; Sun, 04 Oct 2026
 10:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-14-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-14-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:43:17 -0700
X-Gm-Features: AclHuK-Z2ieyqrFQLh5f1D20FCqfsVRqEWMyJIzhNXdOxd9iUhJDwyyLAY8lrcs
Message-ID: <CAJuCfpFounkD97p9iJ8zUunAMoOv+h8Tnxf2NOkp7qs3cfqs7w@mail.gmail.com>
Subject: Re: [PATCH v4 14/38] mm/vma: add vma[_flags]_is_mm_managed() predicates
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
	"Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
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

On Sat, Oct 3, 2026 at 6:38=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Rather than referring to VMA flags with uncertain meaning, add a new
> predicate that explicitly describes what absence of the VMA_PFNMAP_BIT an=
d
> VMA_MIXEDMAP_BIT flags means, and then refer to that function for
> determining VMA mergeability.
>
> If neither of these flags are set, that means the contents of the mapping
> are managed by core mm.
>
> Otherwise they are instead owned by some other kernel component, usually =
a
> driver: the memory may be MMIO, kernel-allocated pages or even ordinary
> pages the driver maps itself, but core mm must not populate, reclaim,
> migrate, copy-on-write or merge the range itself.
>
> We initially also treat VMA_IO_BIT as implying a mapping is not mm-manage=
d,
> as by implication it cannot be. (mlock() also sets VMA_IO_BIT transiently
> on ordinary VMAs while locking them, which is addressed later in this
> series.)
>
> However the intent is to in future remove this, as no mapping should be
> marked as an I/O mapping without also being marked with VMA_PFNMAP_BIT.
>
> This forms the basis of further work intended to improve how we express V=
MA
> properties such as this.
>
> Also update the VMA userland tests to reflect the change.
>
> No functional change intended.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  include/linux/mm.h              | 53 +++++++++++++++++++++++++++++++++++=
+++++-
>  tools/testing/vma/include/dup.h | 29 +++++++++++++++++++++-
>  2 files changed, 80 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 97e1eb4fe3a4..83953757735a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1612,6 +1612,41 @@ static inline bool vma_is_shared_maywrite(const st=
ruct vm_area_struct *vma)
>         return is_shared_maywrite(&vma->flags);
>  }
>
> +/**
> + * vma_flags_is_mm_managed() - Do the specified VMA flags indicate that =
the
> + * contents of the VMA are managed by core mm?
> + * @flags: The VMA flags to test.
> + *
> + * Such a mapping is one established by a simple mmap() or brk() with no=
 driver
> + * or other kernel component involved.
> + *
> + * They are rmappable, and core mm services rmap operations including re=
claim,
> + * as well as population, CoW and merge/split (if eligible).
> + *
> + * Mappings which fail this test are those where this is not the case -
> + * e.g. MMIO, user-mapped kernel pages, udmabuf (pfnmap shmem), etc.
> + *
> + * Returns: true if the flags indicate an mm-managed mapping.
> + */
> +static inline bool vma_flags_is_mm_managed(const vma_flags_t *flags)
> +{
> +       return !vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BI=
T,
> +                                  VMA_IO_BIT);
> +}
> +
> +/**
> + * vma_is_mm_managed() - Are the contents of @vma managed by core mm?
> + * @vma: The VMA to test.
> + *
> + * See vma_flags_is_mm_managed() for a description of this property.
> + *
> + * Returns: true if the VMA is mm-managed.
> + */
> +static inline bool vma_is_mm_managed(const struct vm_area_struct *vma)
> +{
> +       return vma_flags_is_mm_managed(&vma->flags);
> +}
> +
>  /**
>   * vma_flags_can_merge() - Do the specified VMA flags permit the VMA to =
be
>   * merged with another?
> @@ -1620,7 +1655,23 @@ static inline bool vma_is_shared_maywrite(const st=
ruct vm_area_struct *vma)
>   */
>  static inline bool vma_flags_can_merge(const vma_flags_t *flags)
>  {
> -       return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
> +       /*
> +        * VMA merging assumes that a VMA's flags and fields completely d=
escribe
> +        * its state.
> +        *
> +        * However, mappings which are not mm-managed may have establishe=
d state
> +        * upon mapping not embodied in any attribute of the VMA.
> +        *
> +        * Additionally, private (CoW) PFN maps encode the source PFN of =
the
> +        * range in vma->vm_pgoff, which may otherwise cause spurious mer=
ges.
> +        */
> +       if (!vma_flags_is_mm_managed(flags))
> +               return false;
> +       /* VMA explicitly marked as being unmergeable. */
> +       if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
> +               return false;
> +
> +       return true;
>  }
>
>  /**
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index a6a8e53c4b38..89c645a6ad60 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -1665,7 +1665,34 @@ static inline bool file_is_dev_zero(const struct f=
ile *file)
>         return file && file->f_op =3D=3D &zero_fops;
>  }
>
> +static inline bool vma_flags_is_mm_managed(const vma_flags_t *flags)
> +{
> +       return !vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BI=
T,
> +                                  VMA_IO_BIT);
> +}
> +
> +static inline bool vma_is_mm_managed(const struct vm_area_struct *vma)
> +{
> +       return vma_flags_is_mm_managed(&vma->flags);
> +}
> +
>  static inline bool vma_flags_can_merge(const vma_flags_t *flags)
>  {
> -       return !vma_flags_test_any_mask(flags, VMA_SPECIAL_FLAGS);
> +       /*
> +        * VMA merging assumes that a VMA's flags and fields completely d=
escribe
> +        * its state.
> +        *
> +        * However, mappings which are not mm-managed may have establishe=
d state
> +        * upon mapping not embodied in any attribute of the VMA.
> +        *
> +        * Additionally, private (CoW) PFN maps encode the source PFN of =
the
> +        * range in vma->vm_pgoff, which may otherwise cause spurious mer=
ges.
> +        */
> +       if (!vma_flags_is_mm_managed(flags))
> +               return false;
> +       /* VMA explicitly marked as being unmergeable. */
> +       if (vma_flags_test(flags, VMA_DONTEXPAND_BIT))
> +               return false;
> +
> +       return true;
>  }
>
> --
> 2.55.0
>
