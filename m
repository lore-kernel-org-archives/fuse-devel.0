Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE21E40F749
	for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 17:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270254; cv=none; b=KzyMkaiZuiSkeZlxlqYkWaLjae545v/xsNdDZMChZ3k4vP02HEjIWhOLziNDoEYVUNLpyj0udQ5a7/I13S7A6QSepq/hUoJ9zMAtBlH7EpJbG/4MVTW+bwbejQSbFxsPDWgLUFio380LeF+ZQULlv6bzS5tOE2siRd37aIXbcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270254; c=relaxed/simple;
	bh=N9G2xDWLJkhjpVHjPudlC9eB56JQvy0Q3UFpvQ70GnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW/jTB9MLNEwbYTxidsqZaovFyr0CwnL61kvTRWs/q/JuVy+jMjaJs68XS+F2qOvos5GasjlhGMtnpfQDH0QJNFQfXTRM3CTKzR5AEnMB9d0D/kr5vsJDF6B6t8ucX2WR+OXdlmNOOLkss1Hf/EvaeKwWItBn+CFKRb+Dxdny5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ErZ/HyKx; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ErZ/HyKx"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e28a62abso911301cf.1
        for <fuse-devel@lists.linux.dev>; Thu, 24 Sep 2026 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790270251; x=1790875051; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=ErZ/HyKxEzPtildauaVvuG9CsrkCE6rm90GrsxhZ/9dR1VJHQ5TU0zqxk8vUTUvjZs
         nJfyJJbwj0WcrVO6bO1gj4yRQ0M9Di5Jisek2cm8rrcYFX0jcc7dN2hVJ0lCOu1QH7AM
         i/0CdBvG8AO1gsINCUVhBbouPdCcqVPUwQWIhojRh+IF2Co7KLlN0Wp8RLgRAZYztdQ7
         IhYYWy4GaPusM+8lZBXZYlihTwBNWhFju5P8C8w632FQVCZrJSSOmPvcZZF50mt6NQAM
         1nLMmPt86xun46DnSski/v1DDns+vtvdzzInnhmh3HeVJYognTzwuDg9bZeAtSgzp2Gh
         Gp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270251; x=1790875051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=C9LoBdhSzRa5TV2pvZResM0ihyb4/meNH1WY9aZDVSbl9it2Bx/eX22Upv21SuLH9u
         zdPqdjkWc+YOjq9bIUVveX2J65n9DsyzypA7pmAraKD+QO7O2N+1arqG9E0XrvdE1e1E
         RJEPDKZkztkPvf9kdnjYLE1hPJ+oWGCvd9FyPhhMUSjWtxOCl+iQ9o4lFFOaDMAhc9ll
         8mmtO+Z43wKHne/eWFBr+DaqBUWd4Vb4JQM0sPLCv7hEjE9sesiFdV4K1J1ruxJmd0CZ
         ynZMx7hj8kkuG2Cz2rSwuSpP6Rs2iqPC5t7c6rakySjv6wG61El18B7402IWduaPN2y7
         Dl7A==
X-Forwarded-Encrypted: i=1; AKwUvBzow3m17CZ+okJ/nTjnPRv5VfrnbQU/xVTCpeX68gGRWw/ZdiVhr7bE7TnBfQeMmghbCncL4gsMBwYa@lists.linux.dev
X-Gm-Message-State: AFuF++mjuJfa4oKH0wgOGY+J5znahwqRGcwz6eNvNRhEHBCeQx4CFPZe
	myp32M9Fh9j0MDAf7GSnbTIMBBYQyOoLI3XycckwAJyOUjmiyWt9lgFRO1pFmoWW8YE=
X-Gm-Gg: AYBFou1cPeaxKzt8gJUe6rBYePJ/ICreQzxWFpMlIV/tUsZ6Rt7vbfDmHtLemqLoqq6
	qNM23FvEuH+X1Fhxu7KmdlbIDfThPQ2R1+6Y0OlEws3Cg7jfOfulLVyIl/Won9KPPjdi5nTWWnJ
	f56tvSjDH1EbcpUi+KVETEbI1lr5tUtfD/nbPyPcw0ayrV5yoDY0hRkmT2m3GvbrsU7S30uLBLP
	jhZu/oqLm6ibR3JuErWuP6lzEhIaB3oXgN5/VJ0ulTnk+rt1WAaBq1JXk6jo8CiCQydpaHSWKnV
	IX5RnJJiWobMPknhL8OilVVGfDPlnoyazOvqmh8KORR6IwH144O+dCLwjcHqiUc9T6Mb+dZNNmH
	mNb1BX+4fTZxUtn2mMQPraXuFZTd4ACNT1P3pXHhkbCkkIRVBa0I2dq9cBJdozQvutmb+ta7oeN
	kOaqQvPoKnV7Y0JJnr8hQC6FMKZyuk+hcjTc00WdwMt3fHV9brfCcaZcX9lnE9kzY1T/+Fqaomb
	ggX2X7jc52q5ugIy3uhMxsA96PtyFThACCbHHsVVLvw9m0aFmiNxeM=
X-Received: by 2002:a05:622a:2b05:b0:530:42e4:f001 with SMTP id d75a77b69052e-532feb3025amr31555731cf.46.1790270250746;
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532f8b7174asm25743881cf.14.2026.09.24.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:17:28 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 04/40] mm: consistently validate VMA state after
 mmap[_prepare] hooks
Message-ID: <arVW5i8pvySq6Co2@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:13PM +0100, Lorenzo Stoakes (ARM) wrote:
>  static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
>  {
...
> +	err = mmap_hook_validate(prev_start, prev_end, &prev_flags, vma);
> +	if (unlikely(err)) {
> +		vma->vm_start = prev_start;
> +		vma->vm_end = prev_end;
> +		vma_close(vma);
>  	}
> +
> +	return err;
>  }
>  

I indepdeantly validated the sashiko report on this chunk.  Seems like
close() should be deferred until after __map_new_file_vma() calls
unmap_region().

suggested fix is to drop vma_close() from mmap_file()  and update the
cleanup in __mmap_new_file_vma() 

if (error) {
	UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
		    map->prev, map->next);
	vma_iter_set(vmi, vma->vm_end);
	unmap_region(&unmap);

	/* Release driver state only after its mappings are gone. */
	vma_close(vma);

	if (map_same_file(map))
		fput(map->vm_file);
	vma->vm_file = NULL;

	return error;
}

Example race:

  Thread A                              Thread B

  mmap(MAP_FIXED, address A)
    driver remap_pfn_range(A, page P)
                                         load/store at known address A
                                         hardware finds the new present PTE
    validation fails
    ->close() frees page P
                                         UAF
    unmap_region()
    TLB shootdown

With that fix

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

~Gregory

