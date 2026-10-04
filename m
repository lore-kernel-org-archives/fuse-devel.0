Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956A5477E2E
	for <fuse-devel@lists.linux.dev>; Sun,  4 Oct 2026 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138265; cv=pass; b=tLhIqf/Pcgb1nooZQMUCU9hJ7Ym4J/MWXXlHm8Z3Qjr/cibam2LxyN98BbQC7gYo6G3qLnPqST4thh7ZZCEiUnyVHuU102u3jKaweTk8N+vcGFp4M+ZgKFDxwV/CsrY/zGB6O8vBGwwlR+PEGW+ExG3yhMy4gDhYvQc3/osa47k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138265; c=relaxed/simple;
	bh=3aBRZG0J7nrNd8eWZI+tOUTLRCjKVPsGyHM+wAKTgfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZGJt29VtRu3+IbZjx1g+Hi+h+4eAwv2uGhoiPYYLNNl1q6ZWhMJbYx9LNqpwE4JUTUvGh8Qz9xV5ji13lbR4bQ2FsY/4MM6T4sGqkq5y+xJK5yyY061xxEFEb3CAd0Y61NjlAM+d7WjITAZl5xf+cek4oUxOLXtfsdX9ktpKzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vHESjkf+; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vHESjkf+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso7774a12.0
        for <fuse-devel@lists.linux.dev>; Sun, 04 Oct 2026 11:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791138260; cv=none;
        d=google.com; s=arc-20260327;
        b=S81DHafvoG+I6ahBttmowfaGgXH/hdiFqNBdz3H2ubcnBjDoT76hfVxTwAuZCfsiWB
         Au0PYmdfMcDu3GaIFNbqJyD3a6AiHIfyrzpnnd6ncGf/cecBWadtg35ba7HPSraT1LYR
         mONlPfyYPTWZGi+Z76vKehqUDvCQsfYNOtP8Ldv45xIf3UuIlWwqg29xKJX0lAkrWhR/
         qVxWKHNoZ/sTCfuovofCwcsnOwj7/3RdLviubHrdEGmklWLuXutBDxVXeL67b98pD8PA
         7GHCvRSPBeyzpprxzwc5bM9EpOfrnHByt3QwhuXiNCIdemlSiuKE3KCVC2jMmlZPcaQP
         glWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        fh=NZRq4+lgqWA0QIJ2jfB8ZzQZtDj6Ni/cT03+lKASW8w=;
        b=dFdkjO8et4lijTcdAGG6zlBDp1B6RClhlM0F7Gpl9PEo8E61VE2VhF/U3AY7bI2uOI
         H/17Xq2RBYlGx4jh02mV5VJEUB7P1D7za3OB7QYeC7tshgy4HsW3zHUWW3p/CUPSfzrU
         cnhTBQapNL1T8xoM0L75DZw4xnHo2sI35EO1+yysEpmqJJymJ7Lcj5dbT5Qsrr32CDE4
         UNLq+FU2fgG3utRKAhoz4jHtAsWoE4jLUTDu7i8/D7P3iG4kA9Tq4Y1/KvNxtSYCwwwd
         ibOSIeCCq4Dd/72BadNSp6TJYVuFuxnRng85rZ3Pp1tsuzPVDS62q9tdC8qedidSxQzg
         V1JA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791138260; x=1791743060; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=vHESjkf+Tq+uTR20HFjrwl+CvuZljnQY2KVK0TZe/acJG+868sAoOM0BGPzq9d6QlD
         FdxuwiNJxGIPMUCtFwbwxxBqRE+rwXZG7AFaRqgQcud2HqtrQKXQK1TvdnO81WK8fhI6
         s+0o5npZac6dQaxKScWAoI83kZYr+ytEj3dXvOfONb1toSHKJXHM7zCydnJNoMtqnTRg
         Hdjgv0kCctyUg5LgfZyBBcy/vtIsrMFVb3VY/BsWQiXy1AUrAsvIBRA2DzaOLhx5QK5b
         fIwBQ3VoYglPGtYdVjjDxOSQRXoPIIkosaBstwbnOhC/9E3zdHdIO2DxBvEJ7r3HXoks
         tzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791138260; x=1791743060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COuPsBcUBk1eT8Q71dO8QdpqB3ZPgP0C77xCCCNJQiA=;
        b=cMspgmjpkLUC4rETodwhU0sSevJln/ZcyFTaPSMJRPp1De58fV+tV/QFpv2cpFq9zA
         3ASoRQFCUCYx+LIEr+3hDO4oxn0+gmo8SI3GEfI3iXoCwNSoo3PfD/Xa8fjEB0ae2t+y
         2wXJMZI07ZvOhd8YKcQN12hKI+9O5Ew82Le8d+ab3xDAsm6918WC2iyV8spt6jflHVSi
         fCvgXNAJDVlnIgIHusXvhhEm5B7g8juqqxAw4dYrYPyv1pTePWv9tSv9ZgQmDVQ2oG1L
         46F7tA+quWlIab3ZGLdl+d3Rv4X3ikqV4cuvuhS1U8nix++12ld68LFWk/lb6g4hdQfT
         5V3g==
X-Forwarded-Encrypted: i=1; AKwUvBxt1G3CsV+2AESiDDz5YT3o683taLUaa4zV6bYxQOCmQ3FXIu2gFobFTkqoxrkKTxZwNLTMsmYhjN4Q@lists.linux.dev
X-Gm-Message-State: AFq9FYJHara93AYjcOz6UGLScPM+zw7+yjWGFkBJcfMhZVImJwOFiSZ5
	vXKTogrQolP6ND7mQJrXheg3qkakRgGCQwkUyMu48jz6Bw+qRpEH3wocBc0CEgAhNdDszC+WuSp
	NMGL+Ym30bXdagDaF6tbzDEMPbJtOmtQV2lZXub+u
X-Gm-Gg: AYBFou09KxkU93O6f+L/nG/GuRXH5vrjtz/BzG1yw2g3lATOEwSqJBCtfiF0cfVTw5E
	mBA3tPmaLgOaKxQVvSasOQHYIWxOH6fx5sczlzy0zzI0uDCv/a2FeSjtVoXEZKoFbFhQmFT9TTi
	ZM8mxL+mlxruxajOxdV+cb+7+2dqhpladQUdv3br+LnbGczTsfBF7mzH0UqIFkEMtiSXRzC8BdR
	0ylNmZEqcxRs9fo88wH18rNBAb1dw1d7YjPltRgMXiDhDSySHV2jnWR7D3VCeVvXYsIH0mW+Y5q
	8OWP621/PlgHtzxbyMKfRgegpsdJjg7QZpBKg55Ipt2gNpRAgYuzBLtajlqid+1RR4w=
X-Received: by 2002:a05:6402:a2cb:10b0:6af:7a5a:97e4 with SMTP id
 4fb4d7f45d1cf-6afaf6bf03amr34523a12.12.1791138257648; Sun, 04 Oct 2026
 11:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-20-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 11:24:03 -0700
X-Gm-Features: AclHuK9H1gPgFkK4n-5s4Gd8NQjwfuvbGlNRYoPrM6gC5ICSAC1H3Sf5qTdT1bA
Message-ID: <CAJuCfpHOo8UhAZMvO5A3dKbqxQGAWtKGMHXJ+Fc=qwH=Nm0b6w@mail.gmail.com>
Subject: Re: [PATCH v4 20/38] mm/gup: error out early on !VMA_MAYREAD_BIT VMAs
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

On Sat, Oct 3, 2026 at 6:40=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> When populating a VMA range via the aptly named populate_vma_page_range()
> an unreadable VMA will always eventually fail with -EFAULT.
>
> That a VMA is accessible is always checked, however VMA_MAYREAD_BIT is no=
t.
>
> All user mappings always have VMA_MAYREAD_BIT set, so this check only
> impacts kernel mappings.
>
> It is implemented specifically to disallow population of uprobes XOL
> mappings which are exec-only.
>
> A nasty interaction with these mappings may occur if they are mlocked, so
> actively disallow this early.
>
> This allows a subsequent commit to remove the VM_IO check in
> __mm_populate() which otherwise requires non-MMIO mappings to be wrongly
> flagged simply as a workaround.
>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  mm/gup.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/mm/gup.c b/mm/gup.c
> index c2dfcb4744bc..e6310a7cc05b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1836,6 +1836,10 @@ long populate_vma_page_range(struct vm_area_struct=
 *vma,
>         if (!vma_is_accessible(vma))
>                 return -EFAULT;
>
> +       /* Unreadable VMAs also cannot be faulted in. */
> +       if (!vma_test(vma, VMA_MAYREAD_BIT))
> +               return -EFAULT;
> +
>         gup_flags =3D FOLL_TOUCH;
>         /*
>          * We want to touch writable mappings with a write fault in order
>
> --
> 2.55.0
>
